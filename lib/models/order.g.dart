// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      buyerId: json['buyerId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      status: json['status'] as String,
      promoCode: json['promoCode'] as String?,
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      paymentMethod: json['paymentMethod'] as String?,
      paymentReference: json['paymentReference'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'buyerId': instance.buyerId,
      'items': instance.items,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'promoCode': instance.promoCode,
      'discountAmount': instance.discountAmount,
      'paymentMethod': instance.paymentMethod,
      'paymentReference': instance.paymentReference,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      ticketTypeId: json['ticketTypeId'] as String,
      ticketTypeName: json['ticketTypeName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) =>
    <String, dynamic>{
      'ticketTypeId': instance.ticketTypeId,
      'ticketTypeName': instance.ticketTypeName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
    };

_$TicketImpl _$$TicketImplFromJson(Map<String, dynamic> json) => _$TicketImpl(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      eventId: json['eventId'] as String,
      ticketTypeId: json['ticketTypeId'] as String,
      buyerId: json['buyerId'] as String,
      ticketNumber: json['ticketNumber'] as String,
      qrCode: json['qrCode'] as String?,
      status: json['status'] as String,
      usedAt: json['usedAt'] == null
          ? null
          : DateTime.parse(json['usedAt'] as String),
      transferredTo: json['transferredTo'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TicketImplToJson(_$TicketImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'eventId': instance.eventId,
      'ticketTypeId': instance.ticketTypeId,
      'buyerId': instance.buyerId,
      'ticketNumber': instance.ticketNumber,
      'qrCode': instance.qrCode,
      'status': instance.status,
      'usedAt': instance.usedAt?.toIso8601String(),
      'transferredTo': instance.transferredTo,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$CreateOrderRequestImpl _$$CreateOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderRequestImpl(
      eventId: json['eventId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      promoCode: json['promoCode'] as String?,
      paymentMethodId: json['paymentMethodId'] as String?,
    );

Map<String, dynamic> _$$CreateOrderRequestImplToJson(
        _$CreateOrderRequestImpl instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'items': instance.items,
      'promoCode': instance.promoCode,
      'paymentMethodId': instance.paymentMethodId,
    };

_$OrderItemRequestImpl _$$OrderItemRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderItemRequestImpl(
      ticketTypeId: json['ticketTypeId'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderItemRequestImplToJson(
        _$OrderItemRequestImpl instance) =>
    <String, dynamic>{
      'ticketTypeId': instance.ticketTypeId,
      'quantity': instance.quantity,
    };

_$TransferTicketRequestImpl _$$TransferTicketRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferTicketRequestImpl(
      recipientEmail: json['recipientEmail'] as String,
    );

Map<String, dynamic> _$$TransferTicketRequestImplToJson(
        _$TransferTicketRequestImpl instance) =>
    <String, dynamic>{
      'recipientEmail': instance.recipientEmail,
    };
