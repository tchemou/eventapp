import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:dio/dio.dart';
import '../config/app_theme.dart';
import '../models/event.dart';
import '../providers/event_provider.dart';
import 'package:flutter/services.dart';
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
                  onPressed: () async {
                    final provider = context.read<EventProvider>();
                    bool success;
                    final isFav = event.isFavorite == true;
                    if (isFav) {
                      success = await provider.removeFavorite(event.id);
                    } else {
                      success = await provider.addFavorite(event.id);
                    }
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(success 
                            ? (isFav ? 'Retiré des favoris' : 'Ajouté aux favoris')
                            : 'Erreur: ${provider.error ?? "Veuillez réessayer"}'),
                          backgroundColor: success ? Colors.green : Colors.red,
                          duration: const Duration(seconds: 2),
                        ),
                      );
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
                  onPressed: () {
                    final shareText = 'Ne manquez pas l\'événement "${event.title}" le $formattedDate à ${event.location} !';
                    Clipboard.setData(ClipboardData(text: shareText));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Détails de l\'événement copiés !'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
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

                  // Mini Map
                  const SizedBox(height: 16),
                  LocationMapPreview(
                    location: event.location,
                    locationDetails: event.locationDetails,
                    latitude: event.latitude,
                    longitude: event.longitude,
                  ),
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

class LocationMapPreview extends StatefulWidget {
  final String location;
  final String? locationDetails;
  final double? latitude;
  final double? longitude;

  const LocationMapPreview({
    Key? key,
    required this.location,
    this.locationDetails,
    this.latitude,
    this.longitude,
  }) : super(key: key);

  @override
  State<LocationMapPreview> createState() => _LocationMapPreviewState();
}

class _LocationMapPreviewState extends State<LocationMapPreview> {
  LatLng? _coordinates;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _resolveCoordinates();
  }

  Future<void> _resolveCoordinates() async {
    if (widget.latitude != null && widget.longitude != null) {
      if (mounted) {
        setState(() {
          _coordinates = LatLng(widget.latitude!, widget.longitude!);
          _isLoading = false;
        });
      }
      return;
    }

    try {
      final dio = Dio();
      // Combine location details for a better search, or just use location
      final query = widget.locationDetails != null 
          ? '${widget.locationDetails}, ${widget.location}, Cameroon'
          : '${widget.location}, Cameroon';

      final response = await dio.get(
        'https://nominatim.openstreetmap.org/search',
        queryParameters: {
          'q': query,
          'format': 'json',
          'limit': 1,
        },
        options: Options(headers: {'User-Agent': 'Events237MobileApp/1.0'}),
      );

      if (response.data is List && (response.data as List).isNotEmpty) {
        final data = response.data[0];
        final lat = double.tryParse(data['lat'].toString());
        final lon = double.tryParse(data['lon'].toString());

        if (lat != null && lon != null && mounted) {
          setState(() {
            _coordinates = LatLng(lat, lon);
            _isLoading = false;
          });
          return;
        }
      }
    } catch (e) {
      debugPrint('Geocoding error: $e');
    }
    
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        height: 200,
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: context.gold),
      );
    }

    if (_coordinates == null) {
      // If we couldn't resolve the location, just show nothing (or a fallback)
      return const SizedBox.shrink();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.gold.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.5),
          child: FlutterMap(
            options: MapOptions(
              initialCenter: _coordinates!,
              initialZoom: 15.0,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.nexgen.events237',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _coordinates!,
                    width: 50,
                    height: 50,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: context.gold,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: context.gold.withOpacity(0.4),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
