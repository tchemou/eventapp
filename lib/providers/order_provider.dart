import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/api_response.dart';
import '../services/order_service.dart';

class OrderProvider extends ChangeNotifier {
  final OrderService _orderService;

  OrderProvider(this._orderService);

  List<Order> _orders = [];
  List<Order> _myOrders = [];
  Order? _currentOrder;
  bool _isLoading = false;
  String? _error;
  Map<String, dynamic>? _promoValidation;

  // Getters
  List<Order> get orders => _orders;
  List<Order> get myOrders => _myOrders;
  Order? get currentOrder => _currentOrder;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Map<String, dynamic>? get promoValidation => _promoValidation;

  /// Create order
  Future<bool> createOrder({
    required String eventId,
    required List<OrderItemRequest> items,
    String? promoCode,
    String? paymentMethodId,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _currentOrder = await _orderService.createOrder(
        eventId: eventId,
        items: items,
        promoCode: promoCode,
        paymentMethodId: paymentMethodId,
      );

      _myOrders.insert(0, _currentOrder!);
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

  /// Get all orders
  Future<bool> getOrders({
    int page = 0,
    int pageSize = 10,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _orders = await _orderService.getOrders(
        page: page,
        pageSize: pageSize,
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

  /// Get my orders
  Future<bool> getMyOrders({
    int page = 0,
    int pageSize = 10,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _myOrders = await _orderService.getMyOrders(
        page: page,
        pageSize: pageSize,
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

  /// Get order by ID
  Future<bool> getOrderById(String orderId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _currentOrder = await _orderService.getOrderById(orderId);
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

  /// Validate promo code
  Future<bool> validatePromoCode({
    required String code,
    required String eventId,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _promoValidation = await _orderService.validatePromoCode(
        code: code,
        eventId: eventId,
      );

      notifyListeners();
      return true;
    } on ApiError catch (e) {
      _error = e.message;
      _promoValidation = null;
      notifyListeners();
      return false;
    } catch (e) {
      _error = e.toString();
      _promoValidation = null;
      notifyListeners();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Clear current order
  void clearCurrentOrder() {
    _currentOrder = null;
    _promoValidation = null;
    notifyListeners();
  }
}
