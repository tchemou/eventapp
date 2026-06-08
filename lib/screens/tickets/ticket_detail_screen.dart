import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../config/app_theme.dart';
import '../../models/order.dart';
import '../../providers/ticket_provider.dart';

class TicketDetailScreen extends StatelessWidget {
  final Ticket ticket;

  const TicketDetailScreen({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<TicketProvider>();
    final qrData = provider.getQrCode(ticket);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail du billet'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // ── QR Code ────────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  QrImageView(
                    data: qrData,
                    version: QrVersions.auto,
                    size: 200,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    qrData.length > 16
                        ? '${qrData.substring(0, 16)}...'
                        : qrData,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ── Infos billet ───────────────────────────────────────────
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _infoRow(
                      context,
                      icon: Icons.confirmation_number_outlined,
                      label: 'Type de billet',
                      value: ticket.ticketType?.name ?? 'Standard',
                    ),
                    const Divider(height: 24),
                    _infoRow(
                      context,
                      icon: Icons.attach_money,
                      label: 'Prix',
                      value:
                          '${ticket.ticketType?.price?.toStringAsFixed(0) ?? '-'} FCFA',
                    ),
                    const Divider(height: 24),
                    _infoRow(
                      context,
                      icon: Icons.verified_outlined,
                      label: 'Statut',
                      value: ticket.status ?? 'INCONNU',
                      valueColor: _statusColor(ticket.status),
                    ),
                    const Divider(height: 24),
                    _infoRow(
                      context,
                      icon: Icons.calendar_today_outlined,
                      label: 'Date d\'achat',
                      value: ticket.purchaseDate
                              ?.toLocal()
                              .toString()
                              .split(' ')[0] ??
                          '-',
                    ),
                    if (ticket.participantName != null) ...[
                      const Divider(height: 24),
                      _infoRow(
                        context,
                        icon: Icons.person_outline,
                        label: 'Participant',
                        value: ticket.participantName!,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ── Bouton transfert ───────────────────────────────────────
            if (ticket.status == 'VALID')
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () => _showTransferDialog(context),
                  icon: Icon(Icons.send_outlined, color: context.gold),
                  label: Text('Transférer le billet',
                      style: TextStyle(color: context.gold)),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: context.gold),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, color: context.gold, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(label,
              style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: valueColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Color? _statusColor(String? status) {
    switch (status) {
      case 'VALID':
        return Colors.green;
      case 'USED':
        return Colors.orange;
      case 'CANCELLED':
        return Colors.red;
      case 'TRANSFERRED':
        return Colors.blue;
      default:
        return null;
    }
  }

  void _showTransferDialog(BuildContext context) {
    final ctrl = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Transférer le billet'),
        content: TextField(
          controller: ctrl,
          decoration: const InputDecoration(
            hintText: 'Nom du nouveau participant',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              if (ctrl.text.trim().isEmpty) return;
              Navigator.pop(context);
              final provider = context.read<TicketProvider>();
              final success = await provider.transferTicket(
                ticket.id,
                ctrl.text.trim(),
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(success
                        ? 'Billet transféré avec succès !'
                        : provider.error ?? 'Erreur'),
                    backgroundColor: success ? Colors.green : Colors.red,
                  ),
                );
              }
            },
            child: Text('Transférer',
                style: TextStyle(color: context.gold)),
          ),
        ],
      ),
    );
  }
}