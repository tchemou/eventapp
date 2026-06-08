import 'package:flutter/material.dart';
import '../models/order.dart';
import '../services/order_service.dart';

class OrderProvider extends ChangeNotifier {
  final OrderService _orderService;

  OrderProvider(this._orderService);

  List<Order> _myOrders = [];
  Order? _currentOrder;
  Order? _lastCreatedOrder; // ✅ ajout pour Flutterwave
  bool _isLoading = false;
  String? _error;
  Map<String, dynamic>? _promoValidation;

  List<Order> get myOrders => _myOrders;
  Order? get currentOrder => _currentOrder;
  Order? get lastCreatedOrder => _lastCreatedOrder; // ✅
  bool get isLoading => _isLoading;
  String? get error => _error;
  Map<String, dynamic>? get promoValidation => _promoValidation;

  /// Créer une commande
  Future<bool> createOrder({
    required String ticketTypeId,
    int quantity = 1,
    String? promoCode,
    String? participantName,
  }) async {
    _setLoading(true);
    try {
      _currentOrder = await _orderService.createOrder(
        ticketTypeId: ticketTypeId,
        quantity: quantity,
        promoCode: promoCode,
        participantName: participantName,
      );
      _lastCreatedOrder = _currentOrder; // ✅
      _myOrders.insert(0, _currentOrder!);
      notifyListeners();
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// ✅ Confirmer une commande après paiement Flutterwave
  Future<bool> confirmOrder(String orderId) async {
    _setLoading(true);
    try {
      final confirmed = await _orderService.confirmOrder(orderId);
      // Met à jour la commande dans la liste
      final index = _myOrders.indexWhere((o) => o.id == orderId);
      if (index != -1) {
        _myOrders[index] = confirmed;
      }
      _currentOrder = confirmed;
      notifyListeners();
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Mes commandes
  Future<bool> getMyOrders() async {
    _setLoading(true);
    try {
      _myOrders = await _orderService.getMyOrders();
      notifyListeners();
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Détail d'une commande
  Future<bool> getOrderById(String orderId) async {
    _setLoading(true);
    try {
      _currentOrder = await _orderService.getOrderById(orderId);
      notifyListeners();
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Valider un code promo
  Future<bool> validatePromoCode({
    required String code,
    required String eventId,
  }) async {
    _setLoading(true);
    try {
      _promoValidation = await _orderService.validatePromoCode(
        code: code,
        eventId: eventId,
      );
      notifyListeners();
      return true;
    } catch (e) {
      _setError(e.toString());
      _promoValidation = null;
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void clearCurrentOrder() {
    _currentOrder = null;
    _lastCreatedOrder = null;
    _promoValidation = null;
    notifyListeners();
  }

  void _setLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  void _setError(String msg) {
    _error = msg;
    notifyListeners();
  }
}