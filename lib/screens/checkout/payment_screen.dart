import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import '../../models/event.dart';
import '../../models/order.dart';
import '../../providers/order_provider.dart';
import '../../providers/auth_provider.dart';
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
  String _selectedPaymentMethod = 'momo';
  double _discountAmount = 0.0;
  bool _promoApplied = false;

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  // ── Code promo ────────────────────────────────────────────────────────────
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
        _discountAmount = (validation['discountAmount'] ?? 0.0).toDouble();
        if (_discountAmount == 0.0 &&
            validation['discountPercentage'] != null) {
          _discountAmount =
              widget.totalPrice * (validation['discountPercentage'] / 100);
        }
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Code promo appliqué avec succès !'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(provider.error ?? 'Code promo invalide'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // ── Lancer Flutterwave ────────────────────────────────────────────────────
void _launchPayment() async {
  final finalPrice =
      (widget.totalPrice - _discountAmount).clamp(0.0, double.infinity);

  final authProvider = context.read<AuthProvider>();
  final email = authProvider.user?.email ?? 'client@nexgenevents.cm';
  final fullName = authProvider.user?.fullName ?? 'Client NexGen';
  final phone = authProvider.user?.phoneNumber ?? '';
  final txRef = 'nexgen-${DateTime.now().millisecondsSinceEpoch}';

  final flutterwave = Flutterwave(
    publicKey: 'FLWPUBK_TEST-c38c7a896e776ac94fbc291fd73e34cf-X',
    currency: 'XAF',
    amount: finalPrice.toStringAsFixed(0),
    customer: Customer(
      name: fullName,
      phoneNumber: phone,
      email: email,
    ),
    paymentOptions: 'mobilemoneyfranco',
    customization: Customization(
      title: 'NexGen Events',
      description: 'Billets — ${widget.event.title}',
    ),
    txRef: txRef,
    isTestMode: true,
    redirectUrl: 'https://nexgenevents.cm/payment/callback', // ← requis en 1.1.0
  );

  final response = await flutterwave.charge(context); // ← context ici

  if (response != null &&
      (response.status == 'successful' ||
          response.status == 'completed')) {
    await _createOrderAfterPayment();
  } else {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response?.status == 'cancelled'
                ? 'Paiement annulé.'
                : 'Paiement échoué. Veuillez réessayer.',
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

  // ── Créer + confirmer la commande après paiement ──────────────────────────
  Future<void> _createOrderAfterPayment() async {
    final provider = context.read<OrderProvider>();
    bool allSuccess = true;
    String? lastOrderId;

    for (final item in widget.items) {
      final success = await provider.createOrder(
        ticketTypeId: item.ticketTypeId,
        quantity: item.quantity,
        promoCode: _promoApplied ? _promoController.text.trim() : null,
      );
      if (!success) {
        allSuccess = false;
        break;
      }
      lastOrderId = provider.lastCreatedOrder?.id;
    }

    // Confirmer la dernière commande créée
    if (allSuccess && lastOrderId != null) {
      await provider.confirmOrder(lastOrderId);
    }

    if (allSuccess && mounted) {
      _showSuccessDialog();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              provider.error ?? 'Erreur lors de la création de la commande'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // ── Dialog succès ─────────────────────────────────────────────────────────
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Paiement Réussi 🎉'),
        content: const Text(
          'Vos billets ont été générés avec succès.\n'
          'Retrouvez-les dans l\'onglet "Billets".',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (_) => const MainShell(initialIndex: 2)),
                (route) => false,
              );
            },
            child: Text(
              'Voir mes billets',
              style: TextStyle(
                  color: context.gold, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final finalPrice =
        (widget.totalPrice - _discountAmount).clamp(0.0, double.infinity);
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
            // ── Résumé événement ──────────────────────────────────────────
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.event.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.calendar_today,
                            size: 16, color: context.gold),
                        const SizedBox(width: 8),
                        Text(
                          widget.event.eventDate
                                  ?.toLocal()
                                  .toString()
                                  .split(' ')[0] ??
                              'Date non précisée',
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 16, color: context.gold),
                        const SizedBox(width: 8),
                        Expanded(child: Text(widget.event.location)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ── Code promo ────────────────────────────────────────────────
            const Text(
              'Code Promo',
              style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _promoController,
                    decoration: InputDecoration(
                      hintText: 'Entrez votre code',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    enabled: !_promoApplied,
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: _promoApplied || provider.isLoading
                        ? null
                        : _applyPromoCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.gold,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: provider.isLoading && !_promoApplied
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.black),
                          )
                        : const Text('Appliquer'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ── Moyen de paiement ─────────────────────────────────────────
            const Text(
              'Moyen de paiement',
              style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildPaymentOption(
                'momo', 'MTN Mobile Money', Icons.phone_android),
            _buildPaymentOption(
                'om', 'Orange Money', Icons.phone_android),
            const SizedBox(height: 32),
          ],
        ),
      ),

      // ── Bottom bar ────────────────────────────────────────────────────────
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
                  const Text('Sous-total',
                      style: TextStyle(color: Colors.grey)),
                  Text('${widget.totalPrice.toStringAsFixed(0)} FCFA'),
                ],
              ),
              if (_promoApplied) ...[
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Réduction',
                        style: TextStyle(color: Colors.green)),
                    Text(
                      '-${_discountAmount.toStringAsFixed(0)} FCFA',
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ],
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    '${finalPrice.toStringAsFixed(0)} FCFA',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: context.gold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  // ✅ Appelle Flutterwave au lieu de créer directement
                  onPressed:
                      provider.isLoading ? null : _launchPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.gold,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: provider.isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                              color: Colors.black),
                        )
                      : const Text(
                          'Payer maintenant',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
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
          border: Border.all(
            color: isSelected ? context.gold : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? context.gold.withOpacity(0.05) : null,
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isSelected ? context.gold : Colors.grey),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: isSelected
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: isSelected ? context.gold : null,
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: context.gold),
          ],
        ),
      ),
    );
  }
}