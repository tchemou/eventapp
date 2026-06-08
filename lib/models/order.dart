import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

// ── Order ─────────────────────────────────────────────────────────────────
@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    @JsonKey(name: 'totalAmount') double? totalAmount,
    String? status,
    @JsonKey(name: 'orderDate') DateTime? createdAt,
    BuyerProfile? buyer,
    List<Ticket>? tickets,
    PaymentInfo? payment,
    String? appliedPromoCode,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

// ── BuyerProfile ──────────────────────────────────────────────────────────
@freezed
class BuyerProfile with _$BuyerProfile {
  const factory BuyerProfile({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? city,
    String? neighborhood,
  }) = _BuyerProfile;

  factory BuyerProfile.fromJson(Map<String, dynamic> json) =>
      _$BuyerProfileFromJson(json);
}

// ── TicketTypeInfo ────────────────────────────────────────────────────────
@freezed
class TicketTypeInfo with _$TicketTypeInfo {
  const factory TicketTypeInfo({
    String? id,
    String? name,
    double? price,
    int? availableQuantity,
    int? soldQuantity,
    bool? isVisible,
    bool? isFree,
  }) = _TicketTypeInfo;

  factory TicketTypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TicketTypeInfoFromJson(json);
}

// ── Ticket ────────────────────────────────────────────────────────────────
@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    required String id,
    String? qrCode,
    String? status,
    DateTime? purchaseDate,
    String? participantName,
    DateTime? createdAt,
    bool? nominal,
    @JsonKey(name: 'ticketType') TicketTypeInfo? ticketType,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) =>
      _$TicketFromJson(json);
}

// ── PaymentInfo ───────────────────────────────────────────────────────────
@freezed
class PaymentInfo with _$PaymentInfo {
  const factory PaymentInfo({
    String? id,
    double? amount,
    String? currency,
    DateTime? paymentDate,
    String? status,
    String? paymentMethod,
    String? transactionReference,
  }) = _PaymentInfo;

  factory PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoFromJson(json);
}

// ── OrderItemRequest ──────────────────────────────────────────────────────
@freezed
class OrderItemRequest with _$OrderItemRequest {
  const factory OrderItemRequest({
    required String ticketTypeId,
    required int quantity,
  }) = _OrderItemRequest;

  factory OrderItemRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderItemRequestFromJson(json);
}

// ── TransferTicketRequest ─────────────────────────────────────────────────
@freezed
class TransferTicketRequest with _$TransferTicketRequest {
  const factory TransferTicketRequest({
    required String newParticipantName,
  }) = _TransferTicketRequest;

  factory TransferTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$TransferTicketRequestFromJson(json);
}