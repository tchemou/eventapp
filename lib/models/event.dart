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

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
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
      _$TicketTypeFromJson(json);
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
