import '../config/api_config.dart';
import '../models/order.dart';
import 'http_service.dart';

class OrderService {
  final HttpService _httpService;

  OrderService(this._httpService);

  /// Create order
  Future<Order> createOrder({
    required String eventId,
    required List<OrderItemRequest> items,
    String? promoCode,
    String? paymentMethodId,
  }) async {
    final request = CreateOrderRequest(
      eventId: eventId,
      items: items,
      promoCode: promoCode,
      paymentMethodId: paymentMethodId,
    );

    final response = await _httpService.post<Map<String, dynamic>>(
      ApiConfig.createOrder,
      data: request.toJson(),
    );
    return Order.fromJson(response);
  }

  /// Get all orders
  Future<List<Order>> getOrders({
    int page = 0,
    int pageSize = 10,
  }) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      ApiConfig.getOrders,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
      },
    );

    final orders = ((response['data'] ?? response['content'] ?? []) as List)
        .map((e) => Order.fromJson(e as Map<String, dynamic>))
        .toList();
    return orders;
  }

  /// Get my orders
  Future<List<Order>> getMyOrders({
    int page = 0,
    int pageSize = 10,
  }) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      ApiConfig.getMyOrders,
      queryParameters: {
        'page': page,
        'pageSize': pageSize,
      },
    );

    final orders = ((response['data'] ?? response['content'] ?? []) as List)
        .map((e) => Order.fromJson(e as Map<String, dynamic>))
        .toList();
    return orders;
  }

  /// Get order by ID
  Future<Order> getOrderById(String orderId) async {
    final response = await _httpService.get<Map<String, dynamic>>(
      ApiConfig.getOrderById.replaceAll('{id}', orderId),
    );
    return Order.fromJson(response);
  }

  /// Validate promo code
  Future<Map<String, dynamic>> validatePromoCode({
    required String code,
    required String eventId,
  }) async {
    final response = await _httpService.post<Map<String, dynamic>>(
      ApiConfig.validatePromoCode,
      data: {
        'code': code,
        'eventId': eventId,
      },
    );
    return response;
  }

  /// Get tickets from order
  Future<List<Ticket>> getTicketsFromOrder(String orderId) async {
    final response = await _httpService.get<List<dynamic>>(
      '/orders/$orderId/tickets',
    );

    return (response)
        .map((e) => Ticket.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
