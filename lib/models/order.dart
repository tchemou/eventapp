import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String eventId,
    required String buyerId,
    required List<OrderItem> items,
    required double totalPrice,
    required String status,
    String? promoCode,
    double? discountAmount,
    String? paymentMethod,
    String? paymentReference,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String ticketTypeId,
    required String ticketTypeName,
    required int quantity,
    required double unitPrice,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    required String id,
    required String orderId,
    required String eventId,
    required String ticketTypeId,
    required String buyerId,
    required String ticketNumber,
    String? qrCode,
    required String status,
    DateTime? usedAt,
    String? transferredTo,
    DateTime? createdAt,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}

@freezed
class CreateOrderRequest with _$CreateOrderRequest {
  const factory CreateOrderRequest({
    required String eventId,
    required List<OrderItemRequest> items,
    String? promoCode,
    String? paymentMethodId,
  }) = _CreateOrderRequest;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);
}

@freezed
class OrderItemRequest with _$OrderItemRequest {
  const factory OrderItemRequest({
    required String ticketTypeId,
    required int quantity,
  }) = _OrderItemRequest;

  factory OrderItemRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderItemRequestFromJson(json);
}

@freezed
class TransferTicketRequest with _$TransferTicketRequest {
  const factory TransferTicketRequest({
    required String recipientEmail,
  }) = _TransferTicketRequest;

  factory TransferTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$TransferTicketRequestFromJson(json);
}
