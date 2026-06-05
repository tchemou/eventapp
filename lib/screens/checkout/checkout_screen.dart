import 'package:flutter/material.dart';
import '../../models/event.dart';
import '../../models/order.dart';
import '../../config/app_theme.dart';
import 'payment_screen.dart';

class CheckoutScreen extends StatefulWidget {
  final Event event;

  const CheckoutScreen({Key? key, required this.event}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // Map of ticket type ID to quantity selected
  final Map<String, int> _selectedQuantities = {};

  double get _totalPrice {
    double total = 0.0;
    for (var entry in _selectedQuantities.entries) {
      final ticketType = widget.event.ticketTypes?.firstWhere((tt) => tt.id == entry.key);
      if (ticketType != null) {
        total += ticketType.price * entry.value;
      }
    }
    return total;
  }

  int get _totalTickets {
    return _selectedQuantities.values.fold(0, (sum, val) => sum + val);
  }

  void _updateQuantity(String ticketTypeId, int delta, int available) {
    setState(() {
      final current = _selectedQuantities[ticketTypeId] ?? 0;
      final newValue = current + delta;
      
      if (newValue >= 0 && newValue <= available) {
        if (newValue == 0) {
          _selectedQuantities.remove(ticketTypeId);
        } else {
          _selectedQuantities[ticketTypeId] = newValue;
        }
      }
    });
  }

  void _proceedToPayment() {
    if (_totalTickets == 0) return;

    final selectedItems = _selectedQuantities.entries.map((entry) {
      return OrderItemRequest(
        ticketTypeId: entry.key,
        quantity: entry.value,
      );
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentScreen(
          event: widget.event,
          items: selectedItems,
          totalPrice: _totalPrice,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ticketTypes = widget.event.ticketTypes ?? [];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sélection des billets'),
        centerTitle: true,
      ),
      body: ticketTypes.isEmpty
          ? const Center(child: Text("Aucun billet disponible."))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: ticketTypes.length,
              itemBuilder: (context, index) {
                final ticket = ticketTypes[index];
                final qty = _selectedQuantities[ticket.id] ?? 0;
                
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ticket.name,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                ticket.description,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${ticket.price.toStringAsFixed(0)} FCFA',
                                style: TextStyle(
                                  color: context.gold,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => _updateQuantity(ticket.id, -1, ticket.availableQuantity),
                              icon: const Icon(Icons.remove_circle_outline),
                              color: qty > 0 ? context.gold : Colors.grey,
                            ),
                            Text(
                              '$qty',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () => _updateQuantity(ticket.id, 1, ticket.availableQuantity),
                              icon: const Icon(Icons.add_circle_outline),
                              color: qty < ticket.availableQuantity ? context.gold : Colors.grey,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
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
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${_totalPrice.toStringAsFixed(0)} FCFA',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: context.gold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _totalTickets > 0 ? _proceedToPayment : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.gold,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Continuer ($_totalTickets billet${_totalTickets > 1 ? 's' : ''})',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
