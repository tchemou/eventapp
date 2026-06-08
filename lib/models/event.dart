import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

// ── Venue (lieu de l'événement) ─────────────────────────────────────────────
@freezed
class Venue with _$Venue {
  const factory Venue({
    required String id,
    String? address,
    String? city,
    String? country,
    String? googleMapsUrl,
    String? onlineUrl,
    bool? isOnline,
  }) = _Venue;

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
}

// ── Organizer ────────────────────────────────────────────────────────────────
@freezed
class Organizer with _$Organizer {
  const factory Organizer({
    String? logo,
    String? description,
    List<String>? socialNetworks,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? city,
  }) = _Organizer;

  factory Organizer.fromJson(Map<String, dynamic> json) =>
      _$OrganizerFromJson(json);
}

// ── TicketType ───────────────────────────────────────────────────────────────
@freezed
class TicketType with _$TicketType {
  const factory TicketType({
    required String id,
    required String name,
    required double price,
    int? availableQuantity,
    int? soldQuantity,
    String? saleStartDate,
    String? saleEndDate,
    int? limitPerPerson,
    bool? isVisible,
    bool? isFree,
    String? eventId,
  }) = _TicketType;

  factory TicketType.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeFromJson(json);
}

// ── Event ────────────────────────────────────────────────────────────────────
@freezed
class Event with _$Event {
  const factory Event({
    required String id,
    required String title,
    String? description,
    String? category,
    List<String>? tags,
    List<String>? languages,
    String? status,

    // ✅ API envoie startDate / endDate
    @JsonKey(name: 'startDate') DateTime? eventDate,
    @JsonKey(name: 'endDate') DateTime? eventEndDate,

    int? maxCapacity,

    // ✅ API envoie coverImageUrl
    @JsonKey(name: 'coverImageUrl') String? imageUrl,

    // ✅ venue est un objet
    Venue? venue,
    Organizer? organizer,

    List<TicketType>? ticketTypes,
    int? availableTicketsCount,
    DateTime? createdAt,
    bool? isPrivate,
    bool? isFavorite,
    String? locationDetails,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

// ── Extension pour afficher le lieu facilement ───────────────────────────────
extension EventLocation on Event {
  String get location {
    if (venue == null) return 'Lieu non précisé';
    final parts = [venue!.address, venue!.city, venue!.country]
        .where((e) => e != null && e.isNotEmpty)
        .toList();
    return parts.join(', ');
  }
}

// ── EventFilterParams ────────────────────────────────────────────────────────
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