import 'package:flutter/material.dart';
import '../models/order.dart';
import '../services/order_service.dart';

enum PaymentStatus { idle, loading, success, failed }

class PaymentProvider extends ChangeNotifier {
  final OrderService _orderService;

  PaymentProvider(this._orderService);

  PaymentStatus _status = PaymentStatus.idle;
  Order? _currentOrder;
  String? _error;
  String? _transactionRef;

  // ─── Getters ──────────────────────────────────────────────────────────────
  PaymentStatus get status => _status;
  Order? get currentOrder => _currentOrder;
  String? get error => _error;
  String? get transactionRef => _transactionRef;
  bool get isLoading => _status == PaymentStatus.loading;

  // ─── Créer une commande ───────────────────────────────────────────────────
  Future<Order?> createOrder({
    required String ticketTypeId,
    int quantity = 1,
    String? promoCode,
    String? participantName,
  }) async {
    _setStatus(PaymentStatus.loading);
    try {
      final order = await _orderService.createOrder(
        ticketTypeId: ticketTypeId,
        quantity: quantity,
        promoCode: promoCode,
        participantName: participantName,
      );
      _currentOrder = order;
      notifyListeners();
      return order;
    } catch (e) {
      _setError(e.toString());
      return null;
    } finally {
      _setStatus(PaymentStatus.idle);
    }
  }

  // ─── Confirmer après paiement Flutterwave ─────────────────────────────────
  Future<bool> confirmPayment({
    required String orderId,
    required String transactionRef,
  }) async {
    _setStatus(PaymentStatus.loading);
    _transactionRef = transactionRef;
    try {
      final order = await _orderService.confirmOrder(orderId);
      _currentOrder = order;
      _setStatus(PaymentStatus.success);
      return true;
    } catch (e) {
      _setError(e.toString());
      _setStatus(PaymentStatus.failed);
      return false;
    }
  }

  // ─── Annuler une commande ─────────────────────────────────────────────────
  Future<void> cancelOrder(String orderId) async {
    try {
      await _orderService.cancelOrder(orderId);
      _currentOrder = null;
      _setStatus(PaymentStatus.idle);
    } catch (e) {
      _setError(e.toString());
    }
  }

  // ─── Reset ────────────────────────────────────────────────────────────────
  void reset() {
    _status = PaymentStatus.idle;
    _currentOrder = null;
    _error = null;
    _transactionRef = null;
    notifyListeners();
  }

  void _setStatus(PaymentStatus s) {
    _status = s;
    notifyListeners();
  }

  void _setError(String msg) {
    _error = msg;
    notifyListeners();
  }
}
