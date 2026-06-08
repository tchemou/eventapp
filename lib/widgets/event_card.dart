import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/event.dart';
import '../config/app_theme.dart';
import '../screens/checkout/checkout_screen.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;

  const EventCard({
    Key? key,
    required this.event,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format the date
    final dateFormatter = DateFormat('dd MMM yyyy', 'fr_FR');
    final timeFormatter = DateFormat('HH:mm', 'fr_FR');
    final formattedDate = dateFormatter.format(event.eventDate);
    final formattedTime = timeFormatter.format(event.eventDate);

    // Get cheapest ticket price if ticketTypes exist
    double? minPrice;
    if (event.ticketTypes != null && event.ticketTypes!.isNotEmpty) {
      minPrice = event.ticketTypes!
          .map((t) => t.price)
          .reduce((curr, next) => curr < next ? curr : next);
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  color: context.gold.withOpacity(0.1),
                  child: event.imageUrl != null && event.imageUrl!.isNotEmpty
                      ? Image.network(
                          event.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildPlaceholder(context),
                        )
                      : _buildPlaceholder(context),
                ),
                // Category badge
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: context.gold,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      event.category,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                // Price badge
                if (minPrice != null)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: context.gold, width: 1),
                      ),
                      child: Text(
                        minPrice == 0 ? 'GRATUIT' : 'Dès ${minPrice.toInt()} FCFA',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: context.gold,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
              ],
            ),
            
            // Content Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  
                  // Date & Time
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 16, color: context.gold),
                      const SizedBox(width: 8),
                      Text(
                        '$formattedDate à $formattedTime',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: context.gold),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          event.location,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Acheter button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CheckoutScreen(event: event),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: context.gold,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Acheter',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Center(
      child: Icon(
        Icons.event,
        size: 64,
        color: context.gold.withOpacity(0.5),
      ),
    );
  }
}
