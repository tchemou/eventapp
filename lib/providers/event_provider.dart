import 'package:flutter/material.dart';
import '../models/event.dart';
import '../models/api_response.dart';
import '../services/event_service.dart';

class EventProvider extends ChangeNotifier {
  final EventService _eventService;

  EventProvider(this._eventService);

  List<Event> _events = [];
  List<Event> _favoriteEvents = [];
  Event? _selectedEvent;
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Event> get events => _events;
  List<Event> get favoriteEvents => _favoriteEvents;
  Event? get selectedEvent => _selectedEvent;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Fetch all events
  /// ✅ FIX : aligné sur EventService.getEvents(status, title, category)
  /// Les paramètres page/pageSize/search n'existent pas dans le service → supprimés
  Future<bool> fetchEvents({
    String? status,
    String? title,
    String? category,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _events = await _eventService.getEvents(
        status: status,
        title: title,
        category: category,
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
  /// ✅ FIX : aligné sur EventService.searchEvents(query) uniquement
  /// Les paramètres category/startDate/endDate/location n'existent pas → supprimés
  Future<bool> searchEvents({required String query}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _events = await _eventService.searchEvents(query: query);

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
  /// ✅ FIX : aligné sur EventService.createEvent(title, description, category,
  ///          startDate, endDate, maxCapacity, venueId, isPrivate)
  /// Les anciens paramètres eventDate/eventEndDate/location/imageUrl → renommés/supprimés
  Future<bool> createEvent({
    required String title,
    required String description,
    required String category,
    required DateTime startDate,
    required DateTime endDate,
    required int maxCapacity,
    String? venueId,
    bool isPrivate = false,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final event = await _eventService.createEvent(
        title: title,
        description: description,
        category: category,
        startDate: startDate,
        endDate: endDate,
        maxCapacity: maxCapacity,
        venueId: venueId,
        isPrivate: isPrivate,
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

      final index = _events.indexWhere((e) => e.id == eventId);
      if (index != -1) {
        _events[index] = _events[index].copyWith(isFavorite: true);
      }

      if (_selectedEvent?.id == eventId) {
        _selectedEvent = _selectedEvent?.copyWith(isFavorite: true);
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

  /// Remove event from favorites
  Future<bool> removeFavorite(String eventId) async {
    try {
      await _eventService.removeFavorite(eventId);

      final index = _events.indexWhere((e) => e.id == eventId);
      if (index != -1) {
        _events[index] = _events[index].copyWith(isFavorite: false);
      }

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