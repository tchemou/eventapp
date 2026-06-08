// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      createdAt: json['orderDate'] == null
          ? null
          : DateTime.parse(json['orderDate'] as String),
      buyer: json['buyer'] == null
          ? null
          : BuyerProfile.fromJson(json['buyer'] as Map<String, dynamic>),
      tickets: (json['tickets'] as List<dynamic>?)
          ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
      payment: json['payment'] == null
          ? null
          : PaymentInfo.fromJson(json['payment'] as Map<String, dynamic>),
      appliedPromoCode: json['appliedPromoCode'] as String?,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalAmount': instance.totalAmount,
      'status': instance.status,
      'orderDate': instance.createdAt?.toIso8601String(),
      'buyer': instance.buyer,
      'tickets': instance.tickets,
      'payment': instance.payment,
      'appliedPromoCode': instance.appliedPromoCode,
    };

_$BuyerProfileImpl _$$BuyerProfileImplFromJson(Map<String, dynamic> json) =>
    _$BuyerProfileImpl(
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      city: json['city'] as String?,
      neighborhood: json['neighborhood'] as String?,
    );

Map<String, dynamic> _$$BuyerProfileImplToJson(_$BuyerProfileImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'city': instance.city,
      'neighborhood': instance.neighborhood,
    };

_$TicketTypeInfoImpl _$$TicketTypeInfoImplFromJson(Map<String, dynamic> json) =>
    _$TicketTypeInfoImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      availableQuantity: (json['availableQuantity'] as num?)?.toInt(),
      soldQuantity: (json['soldQuantity'] as num?)?.toInt(),
      isVisible: json['isVisible'] as bool?,
      isFree: json['isFree'] as bool?,
    );

Map<String, dynamic> _$$TicketTypeInfoImplToJson(
        _$TicketTypeInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'availableQuantity': instance.availableQuantity,
      'soldQuantity': instance.soldQuantity,
      'isVisible': instance.isVisible,
      'isFree': instance.isFree,
    };

_$TicketImpl _$$TicketImplFromJson(Map<String, dynamic> json) => _$TicketImpl(
      id: json['id'] as String,
      qrCode: json['qrCode'] as String?,
      status: json['status'] as String?,
      purchaseDate: json['purchaseDate'] == null
          ? null
          : DateTime.parse(json['purchaseDate'] as String),
      participantName: json['participantName'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      nominal: json['nominal'] as bool?,
      ticketType: json['ticketType'] == null
          ? null
          : TicketTypeInfo.fromJson(json['ticketType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TicketImplToJson(_$TicketImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'qrCode': instance.qrCode,
      'status': instance.status,
      'purchaseDate': instance.purchaseDate?.toIso8601String(),
      'participantName': instance.participantName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'nominal': instance.nominal,
      'ticketType': instance.ticketType,
    };

_$PaymentInfoImpl _$$PaymentInfoImplFromJson(Map<String, dynamic> json) =>
    _$PaymentInfoImpl(
      id: json['id'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      paymentDate: json['paymentDate'] == null
          ? null
          : DateTime.parse(json['paymentDate'] as String),
      status: json['status'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      transactionReference: json['transactionReference'] as String?,
    );

Map<String, dynamic> _$$PaymentInfoImplToJson(_$PaymentInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'currency': instance.currency,
      'paymentDate': instance.paymentDate?.toIso8601String(),
      'status': instance.status,
      'paymentMethod': instance.paymentMethod,
      'transactionReference': instance.transactionReference,
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
      newParticipantName: json['newParticipantName'] as String,
    );

Map<String, dynamic> _$$TransferTicketRequestImplToJson(
        _$TransferTicketRequestImpl instance) =>
    <String, dynamic>{
      'newParticipantName': instance.newParticipantName,
    };
