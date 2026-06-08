import '../config/api_config.dart';
import '../models/order.dart';
import 'http_service.dart';

class OrderService {
  final HttpService _httpService;

  OrderService(this._httpService);

  /// Créer une commande — POST /client/orders
  /// Body: { ticketTypeId, quantity, promoCode?, participantName?, isNominal? }
  Future<Order> createOrder({
    required String ticketTypeId,
    int quantity = 1,
    String? promoCode,
    String? participantName,
    bool isNominal = false,
  }) async {
    final response = await _httpService.post<Map<String, dynamic>>(
      '/client/orders',
      data: {
        'ticketTypeId': ticketTypeId,
        'quantity': quantity,
        if (promoCode != null) 'promoCode': promoCode,
        if (participantName != null) 'participantName': participantName,
        'isNominal': isNominal,
      },
    );
    return Order.fromJson(response['data'] ?? response);
  }

  /// Confirmer une commande — POST /client/orders/{id}/confirm
  Future<Order> confirmOrder(String orderId) async {
    final response = await _httpService.post<Map<String, dynamic>>(
      '/client/orders/$orderId/confirm',
    );
    return Order.fromJson(response['data'] ?? response);
  }

  /// Annuler une commande — DELETE /client/orders/{id}/cancel
  Future<Order> cancelOrder(String orderId) async {
    final response = await _httpService.delete(
      '/client/orders/$orderId/cancel',
    );
    return Order.fromJson(
        (response as Map<String, dynamic>)['data'] ?? response);
  }

  /// Mes commandes — GET /client/orders
  Future<List<Order>> getMyOrders() async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/client/orders',
    );
    final list = (response['data'] ?? []) as List;
    return list.map((e) => Order.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Détail d'une commande — GET /client/orders/{id}
  Future<Order> getOrderById(String orderId) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/client/orders/$orderId',
    );
    return Order.fromJson(response['data'] ?? response);
  }

  /// Valider un code promo — GET /organizer/promo-codes/validate
  /// ⚠️ Nécessite le rôle ORGANISATEUR côté backend
  Future<Map<String, dynamic>> validatePromoCode({
    required String code,
    required String eventId,
  }) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/organizer/promo-codes/validate',
      queryParameters: {'code': code, 'eventId': eventId},
    );
    return response['data'] ?? response;
  }

  /// Mes billets — GET /client/tickets
  Future<List<Ticket>> getMyTickets() async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/client/tickets',
    );
    final list = (response['data'] ?? []) as List;
    return list.map((e) => Ticket.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// Détail d'un billet — GET /client/tickets/{id}
  Future<Ticket> getTicketById(String ticketId) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      '/client/tickets/$ticketId',
    );
    return Ticket.fromJson(response['data'] ?? response);
  }

  /// Transférer un billet — POST /client/tickets/{id}/transfer
  Future<Ticket> transferTicket({
    required String ticketId,
    required String newParticipantName,
  }) async {
    final response = await _httpService.post<Map<String, dynamic>>(
      '/client/tickets/$ticketId/transfer',
      data: {'newParticipantName': newParticipantName},
    );
    return Ticket.fromJson(response['data'] ?? response);
  }

  /// S'inscrire sur liste d'attente — POST /client/waiting-list
  Future<void> joinWaitingList({
    required String buyerId,
    required String ticketTypeId,
  }) async {
    await _httpService.post(
      '/client/waiting-list',
      data: {'buyerId': buyerId, 'ticketTypeId': ticketTypeId},
    );
  }

  /// Se désinscrire de la liste d'attente — DELETE /client/waiting-list/{id}
  Future<void> leaveWaitingList(String waitingListId) async {
    await _httpService.delete('/client/waiting-list/$waitingListId');
  }
}