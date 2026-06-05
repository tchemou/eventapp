import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/order.dart';
import '../../providers/ticket_provider.dart';
import '../../config/app_theme.dart';

class TicketDetailScreen extends StatefulWidget {
  final Ticket ticket;

  const TicketDetailScreen({Key? key, required this.ticket}) : super(key: key);

  @override
  State<TicketDetailScreen> createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen> {
  String? _qrCodeData;
  bool _isLoadingQr = true;

  @override
  void initState() {
    super.initState();
    _fetchQrCode();
  }

  Future<void> _fetchQrCode() async {
    final provider = context.read<TicketProvider>();
    final qrData = await provider.getTicketQRCode(widget.ticket.id);
    if (mounted) {
      setState(() {
        _qrCodeData = qrData;
        _isLoadingQr = false;
      });
    }
  }

  void _transferTicket() {
    // Show a dialog to enter email and transfer
    final emailController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Transférer le billet'),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: 'Email du destinataire',
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () async {
              final email = emailController.text.trim();
              if (email.isEmpty) return;
              
              Navigator.pop(context); // close dialog
              final success = await context.read<TicketProvider>().transferTicket(
                widget.ticket.id, 
                email
              );
              
              if (mounted) {
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Billet transféré avec succès'), backgroundColor: Colors.green),
                  );
                  Navigator.pop(context); // back to tickets list
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Erreur lors du transfert'), backgroundColor: Colors.red),
                  );
                }
              }
            },
            child: const Text('Transférer'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Billet'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Billet #${widget.ticket.ticketNumber}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Statut: ${widget.ticket.status}',
                    style: TextStyle(
                      fontSize: 16,
                      color: widget.ticket.status == 'VALID' ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(height: 32),
                  if (_isLoadingQr)
                    const Padding(
                      padding: EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    )
                  else if (_qrCodeData != null && _qrCodeData!.isNotEmpty)
                    // The backend could return a base64 string or an image URL.
                    // Assuming an image URL for the QR code for simplicity based on the prompt.
                    Image.network(
                      _qrCodeData!,
                      width: 200,
                      height: 200,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.qr_code, size: 200, color: Colors.grey),
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Icon(Icons.qr_code_scanner, size: 100, color: Colors.grey),
                    ),
                  const SizedBox(height: 16),
                  const Text(
                    'Présentez ce code à l\'entrée',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: widget.ticket.status == 'VALID' ? _transferTicket : null,
                icon: const Icon(Icons.send),
                label: const Text('Transférer à un ami'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.gold,
                  side: BorderSide(color: context.gold),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
