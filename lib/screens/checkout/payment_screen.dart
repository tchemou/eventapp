import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/event.dart';
import '../../models/order.dart';
import '../../providers/order_provider.dart';
import '../../config/app_theme.dart';
import '../main_shell.dart';

class PaymentScreen extends StatefulWidget {
  final Event event;
  final List<OrderItemRequest> items;
  final double totalPrice;

  const PaymentScreen({
    Key? key,
    required this.event,
    required this.items,
    required this.totalPrice,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _promoController = TextEditingController();
  String _selectedPaymentMethod = 'momo'; // Default to MoMo
  
  double _discountAmount = 0.0;
  bool _promoApplied = false;

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  void _applyPromoCode() async {
    final code = _promoController.text.trim();
    if (code.isEmpty) return;

    final provider = context.read<OrderProvider>();
    final success = await provider.validatePromoCode(
      code: code,
      eventId: widget.event.id,
    );

    if (success && provider.promoValidation != null) {
      final validation = provider.promoValidation!;
      setState(() {
        _promoApplied = true;
        // The backend might return discount percentage or amount
        // Assuming amount for this example based on total price
        // If the backend returns the new total, use it. Here we mock a generic calculation.
        // In a real scenario, use validation data to compute discount.
        _discountAmount = (validation['discountAmount'] ?? 0.0).toDouble();
        if (_discountAmount == 0.0 && validation['discountPercentage'] != null) {
           _discountAmount = widget.totalPrice * (validation['discountPercentage'] / 100);
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Code promo appliqué avec succès !'), backgroundColor: Colors.green),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(provider.error ?? 'Code promo invalide'), backgroundColor: Colors.red),
      );
    }
  }

  void _confirmOrder() async {
    final provider = context.read<OrderProvider>();
    
    final success = await provider.createOrder(
      eventId: widget.event.id,
      items: widget.items,
      promoCode: _promoApplied ? _promoController.text.trim() : null,
      paymentMethodId: _selectedPaymentMethod,
    );

    if (success) {
      if (mounted) {
        // Show success dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Commande Réussie 🎉'),
            content: const Text('Vos billets ont été générés avec succès. Vous pouvez les retrouver dans l\'onglet "Billets".'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const MainShell(initialIndex: 2)), // Navigate to Tickets tab
                    (route) => false,
                  );
                },
                child: Text('Voir mes billets', style: TextStyle(color: context.gold, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(provider.error ?? 'Erreur lors de la commande'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final finalPrice = (widget.totalPrice - _discountAmount).clamp(0.0, double.infinity);
    final provider = context.watch<OrderProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paiement'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event summary
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.event.title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16, color: context.gold),
                        const SizedBox(width: 8),
                        Text(widget.event.eventDate.toLocal().toString().split(' ')[0]),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: context.gold),
                        const SizedBox(width: 8),
                        Expanded(child: Text(widget.event.location)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Promo Code
            const Text(
              'Code Promo',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _promoController,
                    decoration: InputDecoration(
                      hintText: 'Entrez votre code',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    enabled: !_promoApplied,
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _promoApplied || provider.isLoading ? null : _applyPromoCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.gold,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: provider.isLoading && !_promoApplied
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                      : const Text('Appliquer'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Payment Method
            const Text(
              'Moyen de paiement',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildPaymentOption('momo', 'Mobile Money (MTN)', Icons.phone_android),
            _buildPaymentOption('om', 'Orange Money', Icons.phone_android),
            _buildPaymentOption('card', 'Carte Bancaire', Icons.credit_card),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Sous-total', style: TextStyle(color: Colors.grey)),
                  Text('${widget.totalPrice.toStringAsFixed(0)} FCFA'),
                ],
              ),
              if (_promoApplied) ...[
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Réduction', style: TextStyle(color: Colors.green)),
                    Text('-${_discountAmount.toStringAsFixed(0)} FCFA', style: const TextStyle(color: Colors.green)),
                  ],
                ),
              ],
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    '${finalPrice.toStringAsFixed(0)} FCFA',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: context.gold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: provider.isLoading ? null : _confirmOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.gold,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: provider.isLoading && _promoApplied
                      ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.black))
                      : const Text('Confirmer la commande', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String id, String label, IconData icon) {
    final isSelected = _selectedPaymentMethod == id;
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? context.gold : Colors.grey.shade300, width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? context.gold.withOpacity(0.05) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? context.gold : Colors.grey),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? context.gold : null,
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: context.gold)
          ],
        ),
      ),
    );
  }
}
