import 'package:flutter/material.dart';
import '../models/order.dart';
import '../services/ticket_service.dart';

class TicketProvider extends ChangeNotifier {
  final TicketService _ticketService;

  TicketProvider(this._ticketService);

  List<Ticket> _tickets = [];
  bool _isLoading = false;
  String? _error;

  List<Ticket> get tickets => _tickets;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<bool> getTickets({int page = 0, int pageSize = 10}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _tickets = await _ticketService.getTickets(
        page: page,
        pageSize: pageSize,
      );
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Le QR code est directement dans l'objet Ticket
  String getQrCode(Ticket ticket) {
    return _ticketService.getQrCodeFromTicket(ticket);
  }

  Future<bool> transferTicket(
    String ticketId,
    String newParticipantName,
  ) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final updatedTicket = await _ticketService.transferTicket(
        ticketId,
        newParticipantName: newParticipantName,
      );

      final index = _tickets.indexWhere((t) => t.id == ticketId);
      if (index != -1) {
        _tickets[index] = updatedTicket;
      }

      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}