import '../models/event.dart';
import 'http_service.dart';

class EventService {
  final HttpService _httpService;

  EventService(this._httpService);

  /// Liste des événements — GET /events
  /// ✅ Paramètres réels selon l'API : status, organizerId, title
  Future<List<Event>> getEvents({
    String? status,
    String? title,
    String? category, // ⚠️ non supporté par l'API, ignoré côté serveur
  }) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/events',
      queryParameters: {
        if (status != null) 'status': status,
        if (title != null) 'title': title,
      },
    );

    final list = (response['data'] ?? []) as List;
    return list.map((e) => Event.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Détail d'un événement — GET /events/{id}
  Future<Event> getEventById(String eventId) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/events/$eventId',
    );
    return Event.fromJson(response['data'] ?? response);
  }

  /// Recherche d'événements — GET /events?title=...
  /// ✅ L'API filtre par title, pas par query séparé
  Future<List<Event>> searchEvents({required String query}) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/events',
      queryParameters: {'title': query},
    );

    final list = (response['data'] ?? []) as List;
    return list.map((e) => Event.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Types de billets d'un événement — GET /ticket-types/event/{eventId}
  /// ✅ Endpoint public, pas besoin d'auth
  Future<List<TicketType>> getTicketTypes(String eventId) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/ticket-types/event/$eventId',
    );
    final list = (response['data'] ?? []) as List;
    return list
        .map((e) => TicketType.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Ajouter aux favoris — POST /client/favorites/{evenementId}
  Future<void> addFavorite(String eventId) async {
    await _httpService.post('/client/favorites/$eventId');
  }

  /// Retirer des favoris — DELETE /client/favorites/{evenementId}
  Future<void> removeFavorite(String eventId) async {
    await _httpService.delete('/client/favorites/$eventId');
  }

  /// Liste des favoris — GET /client/favorites
  Future<List<Event>> getFavorites() async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/client/favorites',
    );
    final list = (response['data'] ?? []) as List;
    return list.map((e) => Event.fromJson(e as Map<String, dynamic>)).toList();
  }

  // ── Endpoints ORGANISATEUR ───────────────────────────────────────────────

  /// Créer un événement — POST /organizer/events (multipart)
  Future<Event> createEvent({
    required String title,
    required String description,
    required String category,
    required DateTime startDate,
    required DateTime endDate,
    required int maxCapacity,
    String? venueId,
    bool isPrivate = false,
  }) async {
    final data = {
      'title': title,
      'description': description,
      'category': category,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'maxCapacity': maxCapacity,
      if (venueId != null) 'venueId': venueId,
      'isPrivate': isPrivate,
    };

    final response = await _httpService.post<Map<String, dynamic>>(
      '/organizer/events',
      data: data,
    );
    return Event.fromJson(response['data'] ?? response);
  }

  /// Modifier un événement — PUT /organizer/events/{id}
  Future<Event> updateEvent(String eventId,
      {String? title,
      String? description,
      String? category,
      DateTime? startDate,
      DateTime? endDate,
      int? maxCapacity}) async {
    final data = <String, dynamic>{};
    if (title != null) data['title'] = title;
    if (description != null) data['description'] = description;
    if (category != null) data['category'] = category;
    if (startDate != null) data['startDate'] = startDate.toIso8601String();
    if (endDate != null) data['endDate'] = endDate.toIso8601String();
    if (maxCapacity != null) data['maxCapacity'] = maxCapacity;

    final response = await _httpService.put<Map<String, dynamic>>(
      '/organizer/events/$eventId',
      data: data,
    );
    return Event.fromJson(response['data'] ?? response);
  }

  /// Publier un événement — POST /organizer/events/{id}/publish
  Future<Event> publishEvent(String eventId) async {
    final response = await _httpService.post<Map<String, dynamic>>(
      '/organizer/events/$eventId/publish',
    );
    return Event.fromJson(response['data'] ?? response);
  }

  /// Annuler un événement — POST /organizer/events/{id}/cancel
  Future<Event> cancelEvent(String eventId) async {
    final response = await _httpService.post<Map<String, dynamic>>(
      '/organizer/events/$eventId/cancel',
    );
    return Event.fromJson(response['data'] ?? response);
  }

  /// Supprimer un événement — DELETE /organizer/events/{id}
  Future<void> deleteEvent(String eventId) async {
    await _httpService.delete('/organizer/events/$eventId');
  }

  /// Créer un type de billet — POST /organizer/ticket-types
  Future<TicketType> createTicketType({
    required String eventId,
    required String name,
    required double price,
    required int availableQuantity,
    bool isFree = false,
    bool isVisible = true,
    int? limitPerPerson,
    DateTime? saleStartDate,
    DateTime? saleEndDate,
  }) async {
    final response = await _httpService.post<Map<String, dynamic>>(
      '/organizer/ticket-types',
      data: {
        'eventId': eventId,
        'name': name,
        'price': price,
        'availableQuantity': availableQuantity,
        'isFree': isFree,
        'isVisible': isVisible,
        if (limitPerPerson != null) 'limitPerPerson': limitPerPerson,
        if (saleStartDate != null)
          'saleStartDate': saleStartDate.toIso8601String(),
        if (saleEndDate != null) 'saleEndDate': saleEndDate.toIso8601String(),
      },
    );
    return TicketType.fromJson(response['data'] ?? response);
  }
}