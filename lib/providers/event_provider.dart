import 'package:flutter/material.dart';
import '../models/event.dart';
import '../models/api_response.dart';
import '../services/event_service.dart';

class EventProvider extends ChangeNotifier {
  final EventService _eventService;

  EventProvider(this._eventService);

  List<Event> _events = [];
  List<Event> _allEvents = [];
  List<Event> _favoriteEvents = [];
  Event? _selectedEvent;
  bool _isLoading = false;
  String? _error;
  int _currentPage = 0;
  int _pageSize = 10;

  // Getters
  List<Event> get events => _events;
  List<Event> get allEvents => _allEvents;
  List<Event> get favoriteEvents => _favoriteEvents;
  Event? get selectedEvent => _selectedEvent;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Upcoming events (eventDate >= now)
  List<Event> get upcomingEvents {
    final now = DateTime.now();
    return _events.where((e) => e.eventDate.isAfter(now) || e.eventDate.isAtSameMomentAs(now)).toList()
      ..sort((a, b) => a.eventDate.compareTo(b.eventDate));
  }

  /// Past events (eventDate < now)
  List<Event> get pastEvents {
    final now = DateTime.now();
    return _events.where((e) => e.eventDate.isBefore(now)).toList()
      ..sort((a, b) => b.eventDate.compareTo(a.eventDate)); // most recent first
  }

  /// Get unique categories from all fetched events
  List<String> get categories {
    final cats = _allEvents.map((e) => e.category).toSet().toList();
    cats.sort();
    return ['Tous', ...cats];
  }

  /// Filter events locally (no API call) — for real-time search
  void filterEventsLocally({String? category, String? search}) {
    var filtered = List<Event>.from(_allEvents);

    if (category != null) {
      filtered = filtered.where((e) => e.category == category).toList();
    }
    if (search != null && search.isNotEmpty) {
      final q = search.toLowerCase();
      filtered = filtered.where((e) =>
        e.title.toLowerCase().contains(q) ||
        (e.description?.toLowerCase().contains(q) ?? false) ||
        e.location.toLowerCase().contains(q) ||
        (e.locationDetails?.toLowerCase().contains(q) ?? false)
      ).toList();
    }

    _events = filtered;
    _error = null;
    notifyListeners();
  }

  /// Fetch all events
  Future<bool> fetchEvents({
    int page = 0,
    int pageSize = 10,
    String? category,
    String? search,
  }) async {
    _isLoading = true;
    _error = null;
    _currentPage = page;
    notifyListeners();

    try {
      var fetchedEvents = await _eventService.getEvents(
        page: page,
        pageSize: pageSize,
      );
      
      _allEvents = List.from(fetchedEvents);

      // Client-side filtering because backend /events doesn't support 'category' and 'search' params
      if (category != null) {
        fetchedEvents = fetchedEvents.where((e) => e.category == category).toList();
      }
      if (search != null && search.isNotEmpty) {
        final queryStr = search.toLowerCase();
        fetchedEvents = fetchedEvents.where((e) =>
          e.title.toLowerCase().contains(queryStr) ||
          (e.description?.toLowerCase().contains(queryStr) ?? false) ||
          e.location.toLowerCase().contains(queryStr) ||
          (e.locationDetails?.toLowerCase().contains(queryStr) ?? false)
        ).toList();
      }

      _events = fetchedEvents;

      notifyListeners();
      return true;
    } on ApiError catch (e) {
      _error = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Get event details
  Future<bool> getEventById(String eventId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _selectedEvent = await _eventService.getEventById(eventId);
      notifyListeners();
      return true;
    } on ApiError catch (e) {
      _error = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Search events
  Future<bool> searchEvents({
    required String query,
    String? category,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _events = await _eventService.searchEvents(
        query: query,
        category: category,
        startDate: startDate,
        endDate: endDate,
        location: location,
      );

      notifyListeners();
      return true;
    } on ApiError catch (e) {
      _error = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Create event
  Future<bool> createEvent({
    required String title,
    required String description,
    required DateTime eventDate,
    required DateTime eventEndDate,
    required String location,
    String? imageUrl,
    required String category,
    String? locationDetails,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final event = await _eventService.createEvent(
        title: title,
        description: description,
        eventDate: eventDate,
        eventEndDate: eventEndDate,
        location: location,
        imageUrl: imageUrl,
        category: category,
        locationDetails: locationDetails,
      );

      _events.add(event);
      notifyListeners();
      return true;
    } on ApiError catch (e) {
      _error = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Add event to favorites
  Future<bool> addFavorite(String eventId) async {
    try {
      await _eventService.addFavorite(eventId);

      // Update local state in main events list
      final index = _events.indexWhere((e) => e.id == eventId);
      if (index != -1) {
        _events[index] = _events[index].copyWith(isFavorite: true);
        // Also add to favorites list if not already present
        if (!_favoriteEvents.any((e) => e.id == eventId)) {
          _favoriteEvents.add(_events[index]);
        }
      }

      if (_selectedEvent?.id == eventId) {
        _selectedEvent = _selectedEvent?.copyWith(isFavorite: true);
      }

      notifyListeners();
      
      // Refresh favorites from backend in background
      _eventService.getFavorites().then((favs) {
        _favoriteEvents = favs;
        notifyListeners();
      }).catchError((_) {}); // Silently ignore refresh errors
      
      return true;
    } on ApiError catch (e) {
      _error = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Remove event from favorites
  Future<bool> removeFavorite(String eventId) async {
    try {
      await _eventService.removeFavorite(eventId);

      // Update local state in main events list
      final index = _events.indexWhere((e) => e.id == eventId);
      if (index != -1) {
        _events[index] = _events[index].copyWith(isFavorite: false);
      }

      // Also remove from favorites list
      _favoriteEvents.removeWhere((e) => e.id == eventId);

      if (_selectedEvent?.id == eventId) {
        _selectedEvent = _selectedEvent?.copyWith(isFavorite: false);
      }

      notifyListeners();
      return true;
    } on ApiError catch (e) {
      _error = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  /// Fetch favorite events
  Future<bool> fetchFavorites() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _favoriteEvents = await _eventService.getFavorites();
      notifyListeners();
      return true;
    } on ApiError catch (e) {
      _error = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
