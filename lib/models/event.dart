import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String id,
    required String title,
    required String description,
    String? imageUrl,
    required DateTime eventDate,
    required DateTime eventEndDate,
    required String location,
    String? locationDetails,
    required String category,
    required String organizer,
    String? organizerId,
    int? attendeeCount,
    double? latitude,
    double? longitude,
    required bool isPublished,
    bool? isFavorite,
    required List<TicketType>? ticketTypes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => 
      _$EventFromJson(_prepareJson(json));

  static Map<String, dynamic> _prepareJson(Map<String, dynamic> json) {
    final mapped = Map<String, dynamic>.from(json);

    // Fix Spring Boot array dates
    void fixDate(String key) {
      if (mapped[key] is List) {
        final list = mapped[key] as List;
        if (list.length >= 3) {
          final year = list[0];
          final month = list[1].toString().padLeft(2, '0');
          final day = list[2].toString().padLeft(2, '0');
          final hour = list.length > 3 ? list[3].toString().padLeft(2, '0') : '00';
          final minute = list.length > 4 ? list[4].toString().padLeft(2, '0') : '00';
          final second = list.length > 5 ? list[5].toString().padLeft(2, '0') : '00';
          mapped[key] = '$year-$month-${day}T$hour:$minute:$second';
        } else {
          mapped[key] = DateTime.now().toIso8601String();
        }
      }
    }

    fixDate('startDate');
    fixDate('endDate');
    fixDate('eventDate');
    fixDate('eventEndDate');
    fixDate('createdAt');
    fixDate('updatedAt');

    // Map dates
    if (mapped['startDate'] != null) mapped['eventDate'] = mapped['startDate'];
    if (mapped['endDate'] != null) mapped['eventEndDate'] = mapped['endDate'];

    // Ensure eventDate and eventEndDate exist
    mapped['eventDate'] ??= DateTime.now().toIso8601String();
    mapped['eventEndDate'] ??= DateTime.now().add(const Duration(hours: 2)).toIso8601String();

    // Map venue to location
    if (mapped['venue'] != null && mapped['venue'] is Map) {
      final venue = mapped['venue'] as Map;
      mapped['location'] = venue['address'] ?? venue['city'] ?? 'Lieu inconnu';
      mapped['locationDetails'] = venue['city'];
    } else {
      mapped['location'] ??= 'Lieu inconnu';
    }

    // Map organizer object
    if (mapped['organizer'] != null && mapped['organizer'] is Map) {
      final org = mapped['organizer'] as Map;
      mapped['organizer'] = org['fullName'] ?? 'Organisateur inconnu';
    } else {
      mapped['organizer'] ??= 'Organisateur inconnu';
    }

    // Map other fields
    mapped['imageUrl'] = mapped['coverImageUrl'];
    mapped['isPublished'] = mapped['status'] == 'PUBLISHED';
    mapped['category'] ??= 'Autre';
    mapped['title'] ??= 'Sans titre';
    mapped['description'] ??= '';

    // Safely cast any unexpected lists to strings to avoid type cast errors
    final stringFields = [
      'id', 'title', 'description', 'imageUrl', 'location', 
      'locationDetails', 'category', 'organizer', 'organizerId'
    ];
    for (final key in stringFields) {
      if (mapped[key] is List) {
        mapped[key] = (mapped[key] as List).join(', ');
      } else if (mapped[key] != null && mapped[key] is! String) {
        mapped[key] = mapped[key].toString();
      }
    }

    return mapped;
  }
}

@freezed
class TicketType with _$TicketType {
  const factory TicketType({
    required String id,
    required String name,
    required String description,
    required double price,
    required int quantity,
    required int availableQuantity,
    required String eventId,
    DateTime? createdAt,
  }) = _TicketType;

  factory TicketType.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeFromJson(_prepareJson(json));

  static Map<String, dynamic> _prepareJson(Map<String, dynamic> json) {
    final mapped = Map<String, dynamic>.from(json);
    
    mapped['description'] ??= '';
    mapped['eventId'] ??= '';
    mapped['name'] ??= 'Billet standard';
    mapped['price'] ??= 0.0;
    
    if (mapped['quantity'] == null) {
      int avail = mapped['availableQuantity'] ?? 0;
      int sold = mapped['soldQuantity'] ?? 0;
      mapped['quantity'] = avail + sold;
    }
    
    mapped['availableQuantity'] ??= 0;
    
    return mapped;
  }
}

@freezed
class EventFilterParams with _$EventFilterParams {
  const factory EventFilterParams({
    String? category,
    String? searchQuery,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
    double? minPrice,
    double? maxPrice,
    int? page,
    int? pageSize,
  }) = _EventFilterParams;

  factory EventFilterParams.fromJson(Map<String, dynamic> json) =>
      _$EventFilterParamsFromJson(json);
}
