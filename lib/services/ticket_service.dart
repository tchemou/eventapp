import '../config/api_config.dart';
import '../models/order.dart';
import 'http_service.dart';

class TicketService {
  final HttpService _httpService;

  TicketService(this._httpService);

  /// Liste des billets de l'utilisateur connecté
  Future<List<Ticket>> getTickets({
    int page = 0,
    int pageSize = 10,
  }) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/client/orders',
    );
    // Les billets sont dans les commandes
    final orders = (response['data'] ?? []) as List;
    final tickets = <Ticket>[];
    for (final order in orders) {
      final orderTickets = (order['tickets'] ?? []) as List;
      tickets.addAll(
        orderTickets.map((e) => Ticket.fromJson(e as Map<String, dynamic>)),
      );
    }
    return tickets;
  }

  /// Détail d'un billet par ID
  Future<Ticket> getTicketById(String ticketId) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      ApiConfig.getTicketById.replaceAll('{id}', ticketId),
    );
    return Ticket.fromJson(response['data'] ?? response);
  }

  /// Récupérer un billet par QR code
  Future<Ticket> getTicketByQrCode(String qrCode) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/client/tickets/qrcode/$qrCode',
    );
    return Ticket.fromJson(response['data'] ?? response);
  }

  /// Transférer un billet
  Future<Ticket> transferTicket(
    String ticketId, {
    required String newParticipantName,
  }) async {
    final response = await _httpService.post<Map<String, dynamic>>(
      ApiConfig.transferTicket.replaceAll('{id}', ticketId),
      data: {'newParticipantName': newParticipantName},
    );
    return Ticket.fromJson(response['data'] ?? response);
  }

  /// Le QR code est déjà dans l'objet Ticket (champ qrCode)
  /// Pas besoin d'appel API séparé
  String getQrCodeFromTicket(Ticket ticket) {
    return ticket.qrCode ?? ticket.id;
  }
}