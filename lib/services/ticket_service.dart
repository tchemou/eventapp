import '../config/api_config.dart';
import '../models/order.dart';
import 'http_service.dart';

class TicketService {
  final HttpService _httpService;

  TicketService(this._httpService);

  /// Get all tickets
  Future<List<Ticket>> getTickets({
    int page = 0,
    int pageSize = 10,
  }) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      ApiConfig.getTickets,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
      },
    );

    final tickets = ((response['data'] ?? []) as List)
        .map((e) => Ticket.fromJson(e as Map<String, dynamic>))
        .toList();
    return tickets;
  }

  /// Get ticket by ID
  Future<Ticket> getTicketById(String ticketId) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      ApiConfig.getTicketById.replaceAll('{id}', ticketId),
    );
    return Ticket.fromJson(response);
  }

  /// Transfer ticket
  Future<Ticket> transferTicket(
    String ticketId, {
    required String recipientEmail,
  }) async {
    final request = TransferTicketRequest(
      recipientEmail: recipientEmail,
    );

    final response = await _httpService.post<Map<String, dynamic>>(
      ApiConfig.transferTicket.replaceAll('{id}', ticketId),
      data: request.toJson(),
    );
    return Ticket.fromJson(response);
  }

  /// Validate ticket (for organizers/entrance)
  Future<Map<String, dynamic>> validateTicket(String ticketId) async {
    final response = await _httpService.post<Map<String, dynamic>>(
      ApiConfig.validateTicket.replaceAll('{id}', ticketId),
    );
    return response;
  }

  /// Get ticket QR code
  Future<String> getTicketQRCode(String ticketId) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/tickets/$ticketId/qr-code',
    );
    return response['qrCode'] as String;
  }

  /// Download ticket PDF
  Future<String> downloadTicketPDF(String ticketId) async {
    // This would typically return a download URL or file path
    final response = await _httpService.get<Map<String, dynamic>>(
      '/tickets/$ticketId/download',
    );
    return response['downloadUrl'] as String;
  }
}
