import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../models/order.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final Order order;
  final String eventTitle;
  final String transactionRef;

  const PaymentSuccessScreen({
    Key? key,
    required this.order,
    required this.eventTitle,
    required this.transactionRef,
  }) : super(key: key);

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;
  late Animation<double> _fade;

  static const _bg = Color(0xFF0A0A0F);
  static const _card = Color(0xFF161618);
  static const _orange = Color(0xFFFF6B35);
  static const _border = Color(0xFF222226);
  static const _green = Color(0xFF22C55E);

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _scale = CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut);
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  // Premier billet de la commande pour le QR code
  Ticket? get _firstTicket =>
      widget.order.tickets?.isNotEmpty == true ? widget.order.tickets!.first : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Stack(
        children: [
          // Glow vert success
          Positioned(
            top: -100, left: -100,
            child: Container(
              width: 350, height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _green.withOpacity(0.06),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: FadeTransition(
                opacity: _fade,
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    // ── Icône succès ─────────────────────────────────────
                    ScaleTransition(
                      scale: _scale,
                      child: Container(
                        width: 80, height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _green.withOpacity(0.15),
                          border: Border.all(
                              color: _green.withOpacity(0.3), width: 2),
                        ),
                        child: const Icon(Icons.check_rounded,
                            color: _green, size: 40),
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text('Paiement réussi !',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5)),
                    const SizedBox(height: 8),
                    Text(
                      'Vos billets sont prêts',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 14),
                    ),

                    const SizedBox(height: 32),

                    // ── Billet / QR Code ─────────────────────────────────
                    if (_firstTicket != null) _buildTicketCard(),

                    const SizedBox(height: 20),

                    // ── Détails transaction ───────────────────────────────
                    _buildTransactionDetails(),

                    const SizedBox(height: 32),

                    // ── Boutons ───────────────────────────────────────────
                    _buildButton(
                      label: 'Voir mes billets',
                      icon: Icons.confirmation_number_outlined,
                      color: _orange,
                      onTap: () {
                        // Navigator.pushNamed(context, '/tickets');
                      },
                    ),
                    const SizedBox(height: 12),
                    _buildButton(
                      label: 'Retour à l\'accueil',
                      icon: Icons.home_outlined,
                      color: _card,
                      textColor: Colors.white.withOpacity(0.7),
                      bordered: true,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (r) => false);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketCard() => Container(
        decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _border),
        ),
        child: Column(
          children: [
            // Header billet
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [_orange.withOpacity(0.2), Colors.transparent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _orange.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        const Icon(Icons.event_rounded, color: _orange, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.eventTitle,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        Text(
                          _firstTicket!.ticketType?.name ?? 'Billet',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _green.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: _green.withOpacity(0.3)),
                    ),
                    child: const Text('VALIDE',
                        style: TextStyle(
                            color: _green,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5)),
                  ),
                ],
              ),
            ),

            // Séparateur en pointillés
            Row(
              children: [
                Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        color: _bg,
                        shape: BoxShape.circle,
                        border: Border.all(color: _border))),
                Expanded(
                  child: LayoutBuilder(
                    builder: (_, constraints) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        (constraints.maxWidth / 8).floor(),
                        (_) => Container(
                            width: 4,
                            height: 1,
                            color: _border),
                      ),
                    ),
                  ),
                ),
                Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        color: _bg,
                        shape: BoxShape.circle,
                        border: Border.all(color: _border))),
              ],
            ),

            // QR Code
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: QrImageView(
                      data: _firstTicket!.qrCode ?? _firstTicket!.id,
                      version: QrVersions.auto,
                      size: 160,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Présentez ce QR code à l\'entrée',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.4), fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _firstTicket!.id.substring(0, 8).toUpperCase(),
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.2),
                        fontSize: 11,
                        fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildTransactionDetails() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _border),
        ),
        child: Column(
          children: [
            _detailRow('Référence', widget.transactionRef),
            const SizedBox(height: 10),
            _detailRow('Montant',
                '${widget.order.totalAmount?.toStringAsFixed(0) ?? '-'} XAF'),
            const SizedBox(height: 10),
            _detailRow('Statut', widget.order.status ?? 'CONFIRME',
                valueColor: _green),
            const SizedBox(height: 10),
            _detailRow('Commande', widget.order.id.substring(0, 8).toUpperCase()),
          ],
        ),
      );

  Widget _detailRow(String label, String value, {Color? valueColor}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.4), fontSize: 13)),
          Text(value,
              style: TextStyle(
                  color: valueColor ?? Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500)),
        ],
      );

  Widget _buildButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    Color? textColor,
    bool bordered = false,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: bordered ? Colors.transparent : color,
            borderRadius: BorderRadius.circular(14),
            border: bordered ? Border.all(color: _border) : null,
            gradient: bordered
                ? null
                : LinearGradient(
                    colors: [color, color.withOpacity(0.8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: textColor ?? Colors.white, size: 18),
              const SizedBox(width: 10),
              Text(label,
                  style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      );
}
