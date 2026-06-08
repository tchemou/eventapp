import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../../config/payment_config.dart';
import '../../models/event.dart';
import '../../providers/auth_provider.dart';
import '../../providers/payment_provider.dart';
import 'payment_success_screen.dart';

class PaymentScreen extends StatefulWidget {
  final TicketType ticketType;
  final String eventTitle;
  final int quantity;
  final String? promoCode;
  final double? discountedPrice;

  const PaymentScreen({
    Key? key,
    required this.ticketType,
    required this.eventTitle,
    required this.quantity,
    this.promoCode,
    this.discountedPrice,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = 'MTN_MOMO';
  final _phoneCtrl = TextEditingController();

  static const _bg = Color(0xFF0A0A0F);
  static const _card = Color(0xFF161618);
  static const _orange = Color(0xFFFF6B35);
  static const _border = Color(0xFF222226);

  double get _totalPrice =>
      (widget.discountedPrice ?? widget.ticketType.price) * widget.quantity;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _startPayment() async {
    final auth = context.read<AuthProvider>();
    final payment = context.read<PaymentProvider>();

    // 1. Créer la commande
    final order = await payment.createOrder(
      ticketTypeId: widget.ticketType.id,
      quantity: widget.quantity,
      promoCode: widget.promoCode,
    );

    if (order == null || !mounted) return;

    // 2. Lancer Flutterwave
    final txRef = 'NXG-${const Uuid().v4().substring(0, 8).toUpperCase()}';

    final flutterwave = Flutterwave(
      context: context,
      publicKey: PaymentConfig.flutterwavePublicKey,
      currency: PaymentConfig.currency,
      redirectUrl: 'https://nexgenevents.com/payment/callback',
      txRef: txRef,
      amount: _totalPrice.toStringAsFixed(0),
      customer: Customer(
        name: auth.user?.fullName ?? 'Client',
        phoneNumber: _phoneCtrl.text.isNotEmpty
            ? _phoneCtrl.text
            : auth.user?.phoneNumber ?? '',
        email: auth.user?.email ?? 'client@nexgenevents.com',
      ),
      paymentOptions: _selectedMethod == 'MTN_MOMO'
          ? 'mobilemoney'
          : 'mobilemoney',
      customization: Customization(
        title: PaymentConfig.companyName,
        description: '${widget.eventTitle} — ${widget.quantity} billet(s)',
        logo: 'https://nexgenevents.com/logo.png',
      ),
      isTestMode: true,
    );

    final response = await flutterwave.charge();

    if (!mounted) return;

    if (response != null && response.status == 'successful') {
      // 3. Confirmer la commande côté backend
      final confirmed = await payment.confirmPayment(
        orderId: order.id,
        transactionRef: response.transactionId ?? txRef,
      );

      if (confirmed && mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, a, __) => PaymentSuccessScreen(
              order: payment.currentOrder!,
              eventTitle: widget.eventTitle,
              transactionRef: response.transactionId ?? txRef,
            ),
            transitionsBuilder: (_, anim, __, child) => FadeTransition(
              opacity: anim,
              child: child,
            ),
          ),
        );
      }
    } else {
      // Paiement annulé ou échoué
      if (mounted) {
        await payment.cancelOrder(order.id);
        _showError('Paiement annulé ou échoué. Réessayez.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: Colors.white.withOpacity(0.7), size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Paiement',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
      ),
      body: Consumer<PaymentProvider>(
        builder: (context, payment, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Récapitulatif ──────────────────────────────────────────
                _buildSectionTitle('Récapitulatif'),
                const SizedBox(height: 12),
                _buildSummaryCard(),
                const SizedBox(height: 24),

                // ── Mode de paiement ───────────────────────────────────────
                _buildSectionTitle('Mode de paiement'),
                const SizedBox(height: 12),
                _buildPaymentMethod(
                  id: 'MTN_MOMO',
                  label: 'MTN Mobile Money',
                  color: const Color(0xFFFFCC00),
                  icon: '📱',
                ),
                const SizedBox(height: 10),
                _buildPaymentMethod(
                  id: 'ORANGE_MONEY',
                  label: 'Orange Money',
                  color: const Color(0xFFFF6600),
                  icon: '🟠',
                ),
                const SizedBox(height: 24),

                // ── Numéro de téléphone ────────────────────────────────────
                _buildSectionTitle('Numéro de paiement'),
                const SizedBox(height: 12),
                _buildPhoneField(),
                const SizedBox(height: 8),
                Text(
                  'Le numéro qui recevra la demande de paiement',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.35), fontSize: 12),
                ),
                const SizedBox(height: 32),

                // ── Bouton payer ───────────────────────────────────────────
                _buildPayButton(payment),
                const SizedBox(height: 16),

                // ── Sécurité ───────────────────────────────────────────────
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock_outline_rounded,
                          color: Colors.white.withOpacity(0.3), size: 14),
                      const SizedBox(width: 6),
                      Text(
                        'Paiement sécurisé par Flutterwave',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) => Text(
        title,
        style: TextStyle(
          color: Colors.white.withOpacity(0.5),
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
      );

  Widget _buildSummaryCard() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _border),
        ),
        child: Column(
          children: [
            _summaryRow('Événement', widget.eventTitle),
            const SizedBox(height: 10),
            _summaryRow('Billet', widget.ticketType.name),
            const SizedBox(height: 10),
            _summaryRow('Quantité', '${widget.quantity}'),
            if (widget.promoCode != null) ...[
              const SizedBox(height: 10),
              _summaryRow('Code promo', widget.promoCode!,
                  valueColor: Colors.green),
            ],
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 1,
              color: _border,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Text(
                  '${_totalPrice.toStringAsFixed(0)} XAF',
                  style: const TextStyle(
                      color: _orange,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _summaryRow(String label, String value, {Color? valueColor}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5), fontSize: 13)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: valueColor ?? Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      );

  Widget _buildPaymentMethod({
    required String id,
    required String label,
    required Color color,
    required String icon,
  }) {
    final selected = _selectedMethod == id;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? color.withOpacity(0.08) : _card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? color : _border,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Text(icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.white.withOpacity(0.7),
                  fontSize: 15,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: selected ? color : Colors.white.withOpacity(0.3),
                    width: 2),
                color: selected ? color : Colors.transparent,
              ),
              child: selected
                  ? const Icon(Icons.check, color: Colors.white, size: 12)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneField() => Container(
        decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _border),
        ),
        child: TextField(
          controller: _phoneCtrl,
          keyboardType: TextInputType.phone,
          style: const TextStyle(color: Colors.white, fontSize: 15),
          decoration: InputDecoration(
            hintText: '+237 6XX XXX XXX',
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.2), fontSize: 15),
            prefixIcon: Icon(Icons.phone_outlined,
                color: Colors.white.withOpacity(0.3), size: 20),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      );

  Widget _buildPayButton(PaymentProvider payment) => GestureDetector(
        onTap: payment.isLoading ? null : _startPayment,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: double.infinity,
          height: 58,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: payment.isLoading
                  ? [Colors.grey.shade800, Colors.grey.shade700]
                  : [const Color(0xFFFF6B35), const Color(0xFFFF4500)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(14),
            border:
                Border.all(color: Colors.white.withOpacity(0.1), width: 0.5),
          ),
          child: Center(
            child: payment.isLoading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.lock_outline_rounded,
                          color: Colors.white, size: 18),
                      const SizedBox(width: 10),
                      Text(
                        'Payer ${_totalPrice.toStringAsFixed(0)} XAF',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
          ),
        ),
      );

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(children: [
        const Icon(Icons.error_outline_rounded, color: Colors.white, size: 18),
        const SizedBox(width: 10),
        Expanded(
            child: Text(msg, style: const TextStyle(color: Colors.white))),
      ]),
      backgroundColor: const Color(0xFFE53935),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
    ));
  }
}
