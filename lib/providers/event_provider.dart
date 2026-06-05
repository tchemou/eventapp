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
  int _currentPage = 0;
  int _pageSize = 10;

  // Getters
  List<Event> get events => _events;
  List<Event> get favoriteEvents => _favoriteEvents;
  Event? get selectedEvent => _selectedEvent;
  bool get isLoading => _isLoading;
  String? get error => _error;

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
      _events = await _eventService.getEvents(
        page: page,
        pageSize: pageSize,
        category: category,
        search: search,
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

      // Update local state
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

      // Update local state
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
