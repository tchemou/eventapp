import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../config/app_theme.dart';
import '../models/event.dart';
import '../providers/event_provider.dart';
import 'checkout/checkout_screen.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('EEEE dd MMMM yyyy', 'fr_FR');
    final timeFormatter = DateFormat('HH:mm', 'fr_FR');
    final formattedDate = dateFormatter.format(event.eventDate);
    final formattedTime = timeFormatter.format(event.eventDate);
    final formattedEndTime = timeFormatter.format(event.eventEndDate);

    // Get cheapest ticket price
    double? minPrice;
    if (event.ticketTypes != null && event.ticketTypes!.isNotEmpty) {
      minPrice = event.ticketTypes!
          .map((t) => t.price)
          .reduce((curr, next) => curr < next ? curr : next);
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero Image AppBar
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    event.isFavorite == true
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: event.isFavorite == true ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    final provider = context.read<EventProvider>();
                    if (event.isFavorite == true) {
                      provider.removeFavorite(event.id);
                    } else {
                      provider.addFavorite(event.id);
                    }
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: event.imageUrl != null && event.imageUrl!.isNotEmpty
                  ? Image.network(
                      event.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _buildHeroPlaceholder(context),
                    )
                  : _buildHeroPlaceholder(context),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: context.gold,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      event.category,
                      style: const TextStyle(
                        color: Color(0xFF1A1200),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Title
                  Text(
                    event.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),

                  // Organizer
                  Row(
                    children: [
                      Icon(Icons.business, size: 16, color: context.gold),
                      const SizedBox(width: 8),
                      Text(
                        'Organisé par ${event.organizer}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  Divider(color: context.gold.withOpacity(0.2)),
                  const SizedBox(height: 24),

                  // Date & Time section
                  _InfoRow(
                    icon: Icons.calendar_today,
                    title: 'Date',
                    value: formattedDate,
                  ),
                  const SizedBox(height: 16),
                  _InfoRow(
                    icon: Icons.access_time,
                    title: 'Heure',
                    value: '$formattedTime — $formattedEndTime',
                  ),
                  const SizedBox(height: 16),
                  _InfoRow(
                    icon: Icons.location_on,
                    title: 'Lieu',
                    value: event.location,
                  ),
                  if (event.locationDetails != null) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 4),
                      child: Text(
                        event.locationDetails!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                  if (event.attendeeCount != null) ...[
                    const SizedBox(height: 16),
                    _InfoRow(
                      icon: Icons.people,
                      title: 'Participants',
                      value: '${event.attendeeCount} inscrits',
                    ),
                  ],

                  const SizedBox(height: 24),
                  Divider(color: context.gold.withOpacity(0.2)),
                  const SizedBox(height: 24),

                  // Description
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    event.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.6,
                        ),
                  ),

                  // Ticket types
                  if (event.ticketTypes != null && event.ticketTypes!.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Divider(color: context.gold.withOpacity(0.2)),
                    const SizedBox(height: 24),
                    Text(
                      'Billetterie',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    ...event.ticketTypes!.map((ticket) => _TicketTypeCard(ticket: ticket)),
                  ],

                  // Bottom padding for FAB
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),

      // CTA Button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: context.gold.withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              // Price
              if (minPrice != null)
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'À partir de',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        minPrice == 0 ? 'GRATUIT' : '${minPrice.toInt()} FCFA',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.gold,
                            ),
                      ),
                    ],
                  ),
                ),
              // Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CheckoutScreen(event: event),
                      ),
                    );
                  },
                  child: const Text('Acheter un billet'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroPlaceholder(BuildContext context) {
    return Container(
      color: context.gold.withOpacity(0.15),
      child: Center(
        child: Icon(Icons.event, size: 80, color: context.gold.withOpacity(0.4)),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: context.gold),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TicketTypeCard extends StatelessWidget {
  final TicketType ticket;

  const _TicketTypeCard({required this.ticket});

  @override
  Widget build(BuildContext context) {
    final isAvailable = ticket.availableQuantity > 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isAvailable
              ? context.gold.withOpacity(0.3)
              : Colors.grey.withOpacity(0.3),
        ),
        color: Theme.of(context).cardTheme.color,
      ),
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
                        color: isAvailable ? null : Colors.grey,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  ticket.description,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  isAvailable
                      ? '${ticket.availableQuantity} places restantes'
                      : 'Épuisé',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: isAvailable ? context.gold : Colors.grey,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              Text(
                ticket.price == 0 ? 'GRATUIT' : '${ticket.price.toInt()} FCFA',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isAvailable ? context.gold : Colors.grey,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
