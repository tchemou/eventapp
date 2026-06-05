import '../config/api_config.dart';
import '../models/event.dart';
import '../models/api_response.dart';
import 'http_service.dart';

class EventService {
  final HttpService _httpService;

  EventService(this._httpService);

  /// Get all events
  Future<List<Event>> getEvents({
    int page = 0,
    int pageSize = 10,
    String? category,
    String? search,
  }) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      ApiConfig.getEvents,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
        if (category != null) 'category': category,
        if (search != null) 'search': search,
      },
    );

    final events = ((response['data'] ?? response['content'] ?? []) as List)
        .map((e) => Event.fromJson(e as Map<String, dynamic>))
        .toList();
    return events;
  }

  /// Get event by ID
  Future<Event> getEventById(String eventId) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      ApiConfig.getEventById.replaceAll('{id}', eventId),
    );
    return Event.fromJson(response);
  }

  /// Search events
  Future<List<Event>> searchEvents({
    required String query,
    String? category,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
  }) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      ApiConfig.searchEvents,
      queryParameters: {
        'query': query,
        if (category != null) 'category': category,
        if (startDate != null) 'startDate': startDate.toIso8601String(),
        if (endDate != null) 'endDate': endDate.toIso8601String(),
        if (location != null) 'location': location,
      },
    );

    final events = ((response['data'] ?? response['content'] ?? []) as List)
        .map((e) => Event.fromJson(e as Map<String, dynamic>))
        .toList();
    return events;
  }

  /// Create event
  Future<Event> createEvent({
    required String title,
    required String description,
    required DateTime eventDate,
    required DateTime eventEndDate,
    required String location,
    String? imageUrl,
    required String category,
    String? locationDetails,
  }) async {
    final data = {
      'title': title,
      'description': description,
      'eventDate': eventDate.toIso8601String(),
      'eventEndDate': eventEndDate.toIso8601String(),
      'location': location,
      'category': category,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (locationDetails != null) 'locationDetails': locationDetails,
    };

    final response = await _httpService.post<Map<String, dynamic>>(
      ApiConfig.createEvent,
      data: data,
    );
    return Event.fromJson(response);
  }

  /// Update event
  Future<Event> updateEvent(
    String eventId, {
    String? title,
    String? description,
    DateTime? eventDate,
    DateTime? eventEndDate,
    String? location,
    String? imageUrl,
    String? category,
  }) async {
    final data = <String, dynamic>{};
    if (title != null) data['title'] = title;
    if (description != null) data['description'] = description;
    if (eventDate != null) data['eventDate'] = eventDate.toIso8601String();
    if (eventEndDate != null)
      data['eventEndDate'] = eventEndDate.toIso8601String();
    if (location != null) data['location'] = location;
    if (imageUrl != null) data['imageUrl'] = imageUrl;
    if (category != null) data['category'] = category;

    final response = await _httpService.put<Map<String, dynamic>>(
      ApiConfig.updateEvent.replaceAll('{id}', eventId),
      data: data,
    );
    return Event.fromJson(response);
  }

  /// Delete event
  Future<void> deleteEvent(String eventId) async {
    await _httpService.delete(
      ApiConfig.deleteEvent.replaceAll('{id}', eventId),
    );
  }

  /// Add event to favorites
  Future<void> addFavorite(String eventId) async {
    await _httpService.post(
      ApiConfig.addFavorite,
      data: {'eventId': eventId},
    );
  }

  /// Remove event from favorites
  Future<void> removeFavorite(String eventId) async {
    await _httpService.delete(
      ApiConfig.removeFavorite.replaceAll('{eventId}', eventId),
    );
  }

  /// Get favorite events
  Future<List<Event>> getFavorites() async {
    final response = await _httpService.get<Map<String, dynamic>>(
      ApiConfig.getFavorites,
    );

    final events = ((response['data'] ?? response['content'] ?? []) as List)
        .map((e) => Event.fromJson(e as Map<String, dynamic>))
        .toList();
    return events;
  }

  /// Get ticket types for event
  Future<List<TicketType>> getTicketTypes(String eventId) async {
    final response = await _httpService.get<List<dynamic>>(
      ApiConfig.getTicketTypes.replaceAll('{eventId}', eventId),
    );

    return (response)
        .map((e) => TicketType.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Create ticket type
  Future<TicketType> createTicketType(
    String eventId, {
    required String name,
    required String description,
    required double price,
    required int quantity,
  }) async {
    final data = {
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
    };

    final response = await _httpService.post<Map<String, dynamic>>(
      ApiConfig.createTicketType.replaceAll('{eventId}', eventId),
      data: data,
    );
    return TicketType.fromJson(response);
  }

  /// Update ticket type
  Future<TicketType> updateTicketType(
    String eventId,
    String ticketTypeId, {
    String? name,
    String? description,
    double? price,
    int? quantity,
  }) async {
    final data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (price != null) data['price'] = price;
    if (quantity != null) data['quantity'] = quantity;

    final response = await _httpService.put<Map<String, dynamic>>(
      ApiConfig.updateTicketType
          .replaceAll('{eventId}', eventId)
          .replaceAll('{id}', ticketTypeId),
      data: data,
    );
    return TicketType.fromJson(response);
  }
}
