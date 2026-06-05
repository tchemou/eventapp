// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get buyerId => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;
  double? get discountAmount => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get paymentReference => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      String eventId,
      String buyerId,
      List<OrderItem> items,
      double totalPrice,
      String status,
      String? promoCode,
      double? discountAmount,
      String? paymentMethod,
      String? paymentReference,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? buyerId = null,
    Object? items = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? promoCode = freezed,
    Object? discountAmount = freezed,
    Object? paymentMethod = freezed,
    Object? paymentReference = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String eventId,
      String buyerId,
      List<OrderItem> items,
      double totalPrice,
      String status,
      String? promoCode,
      double? discountAmount,
      String? paymentMethod,
      String? paymentReference,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? buyerId = null,
    Object? items = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? promoCode = freezed,
    Object? discountAmount = freezed,
    Object? paymentMethod = freezed,
    Object? paymentReference = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.id,
      required this.eventId,
      required this.buyerId,
      required final List<OrderItem> items,
      required this.totalPrice,
      required this.status,
      this.promoCode,
      this.discountAmount,
      this.paymentMethod,
      this.paymentReference,
      this.createdAt,
      this.updatedAt})
      : _items = items;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String id;
  @override
  final String eventId;
  @override
  final String buyerId;
  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double totalPrice;
  @override
  final String status;
  @override
  final String? promoCode;
  @override
  final double? discountAmount;
  @override
  final String? paymentMethod;
  @override
  final String? paymentReference;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Order(id: $id, eventId: $eventId, buyerId: $buyerId, items: $items, totalPrice: $totalPrice, status: $status, promoCode: $promoCode, discountAmount: $discountAmount, paymentMethod: $paymentMethod, paymentReference: $paymentReference, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentReference, paymentReference) ||
                other.paymentReference == paymentReference) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      eventId,
      buyerId,
      const DeepCollectionEquality().hash(_items),
      totalPrice,
      status,
      promoCode,
      discountAmount,
      paymentMethod,
      paymentReference,
      createdAt,
      updatedAt);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String id,
      required final String eventId,
      required final String buyerId,
      required final List<OrderItem> items,
      required final double totalPrice,
      required final String status,
      final String? promoCode,
      final double? discountAmount,
      final String? paymentMethod,
      final String? paymentReference,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get id;
  @override
  String get eventId;
  @override
  String get buyerId;
  @override
  List<OrderItem> get items;
  @override
  double get totalPrice;
  @override
  String get status;
  @override
  String? get promoCode;
  @override
  double? get discountAmount;
  @override
  String? get paymentMethod;
  @override
  String? get paymentReference;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  String get ticketTypeId => throw _privateConstructorUsedError;
  String get ticketTypeName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get unitPrice => throw _privateConstructorUsedError;

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {String ticketTypeId,
      String ticketTypeName,
      int quantity,
      double unitPrice});
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketTypeId = null,
    Object? ticketTypeName = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(_value.copyWith(
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeName: null == ticketTypeName
          ? _value.ticketTypeName
          : ticketTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
          _$OrderItemImpl value, $Res Function(_$OrderItemImpl) then) =
      __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ticketTypeId,
      String ticketTypeName,
      int quantity,
      double unitPrice});
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
      _$OrderItemImpl _value, $Res Function(_$OrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketTypeId = null,
    Object? ticketTypeName = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(_$OrderItemImpl(
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeName: null == ticketTypeName
          ? _value.ticketTypeName
          : ticketTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemImpl implements _OrderItem {
  const _$OrderItemImpl(
      {required this.ticketTypeId,
      required this.ticketTypeName,
      required this.quantity,
      required this.unitPrice});

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  final String ticketTypeId;
  @override
  final String ticketTypeName;
  @override
  final int quantity;
  @override
  final double unitPrice;

  @override
  String toString() {
    return 'OrderItem(ticketTypeId: $ticketTypeId, ticketTypeName: $ticketTypeName, quantity: $quantity, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            (identical(other.ticketTypeId, ticketTypeId) ||
                other.ticketTypeId == ticketTypeId) &&
            (identical(other.ticketTypeName, ticketTypeName) ||
                other.ticketTypeName == ticketTypeName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, ticketTypeId, ticketTypeName, quantity, unitPrice);

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(
      this,
    );
  }
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem(
      {required final String ticketTypeId,
      required final String ticketTypeName,
      required final int quantity,
      required final double unitPrice}) = _$OrderItemImpl;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  String get ticketTypeId;
  @override
  String get ticketTypeName;
  @override
  int get quantity;
  @override
  double get unitPrice;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  String get id => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get ticketTypeId => throw _privateConstructorUsedError;
  String get buyerId => throw _privateConstructorUsedError;
  String get ticketNumber => throw _privateConstructorUsedError;
  String? get qrCode => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime? get usedAt => throw _privateConstructorUsedError;
  String? get transferredTo => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Ticket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {String id,
      String orderId,
      String eventId,
      String ticketTypeId,
      String buyerId,
      String ticketNumber,
      String? qrCode,
      String status,
      DateTime? usedAt,
      String? transferredTo,
      DateTime? createdAt});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? eventId = null,
    Object? ticketTypeId = null,
    Object? buyerId = null,
    Object? ticketNumber = null,
    Object? qrCode = freezed,
    Object? status = null,
    Object? usedAt = freezed,
    Object? transferredTo = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketNumber: null == ticketNumber
          ? _value.ticketNumber
          : ticketNumber // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transferredTo: freezed == transferredTo
          ? _value.transferredTo
          : transferredTo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketImplCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$TicketImplCopyWith(
          _$TicketImpl value, $Res Function(_$TicketImpl) then) =
      __$$TicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String orderId,
      String eventId,
      String ticketTypeId,
      String buyerId,
      String ticketNumber,
      String? qrCode,
      String status,
      DateTime? usedAt,
      String? transferredTo,
      DateTime? createdAt});
}

/// @nodoc
class __$$TicketImplCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$TicketImpl>
    implements _$$TicketImplCopyWith<$Res> {
  __$$TicketImplCopyWithImpl(
      _$TicketImpl _value, $Res Function(_$TicketImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? eventId = null,
    Object? ticketTypeId = null,
    Object? buyerId = null,
    Object? ticketNumber = null,
    Object? qrCode = freezed,
    Object? status = null,
    Object? usedAt = freezed,
    Object? transferredTo = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$TicketImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketNumber: null == ticketNumber
          ? _value.ticketNumber
          : ticketNumber // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transferredTo: freezed == transferredTo
          ? _value.transferredTo
          : transferredTo // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketImpl implements _Ticket {
  const _$TicketImpl(
      {required this.id,
      required this.orderId,
      required this.eventId,
      required this.ticketTypeId,
      required this.buyerId,
      required this.ticketNumber,
      this.qrCode,
      required this.status,
      this.usedAt,
      this.transferredTo,
      this.createdAt});

  factory _$TicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketImplFromJson(json);

  @override
  final String id;
  @override
  final String orderId;
  @override
  final String eventId;
  @override
  final String ticketTypeId;
  @override
  final String buyerId;
  @override
  final String ticketNumber;
  @override
  final String? qrCode;
  @override
  final String status;
  @override
  final DateTime? usedAt;
  @override
  final String? transferredTo;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Ticket(id: $id, orderId: $orderId, eventId: $eventId, ticketTypeId: $ticketTypeId, buyerId: $buyerId, ticketNumber: $ticketNumber, qrCode: $qrCode, status: $status, usedAt: $usedAt, transferredTo: $transferredTo, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.ticketTypeId, ticketTypeId) ||
                other.ticketTypeId == ticketTypeId) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.ticketNumber, ticketNumber) ||
                other.ticketNumber == ticketNumber) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.usedAt, usedAt) || other.usedAt == usedAt) &&
            (identical(other.transferredTo, transferredTo) ||
                other.transferredTo == transferredTo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      orderId,
      eventId,
      ticketTypeId,
      buyerId,
      ticketNumber,
      qrCode,
      status,
      usedAt,
      transferredTo,
      createdAt);

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      __$$TicketImplCopyWithImpl<_$TicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketImplToJson(
      this,
    );
  }
}

abstract class _Ticket implements Ticket {
  const factory _Ticket(
      {required final String id,
      required final String orderId,
      required final String eventId,
      required final String ticketTypeId,
      required final String buyerId,
      required final String ticketNumber,
      final String? qrCode,
      required final String status,
      final DateTime? usedAt,
      final String? transferredTo,
      final DateTime? createdAt}) = _$TicketImpl;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$TicketImpl.fromJson;

  @override
  String get id;
  @override
  String get orderId;
  @override
  String get eventId;
  @override
  String get ticketTypeId;
  @override
  String get buyerId;
  @override
  String get ticketNumber;
  @override
  String? get qrCode;
  @override
  String get status;
  @override
  DateTime? get usedAt;
  @override
  String? get transferredTo;
  @override
  DateTime? get createdAt;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) {
  return _CreateOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderRequest {
  String get eventId => throw _privateConstructorUsedError;
  List<OrderItemRequest> get items => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;
  String? get paymentMethodId => throw _privateConstructorUsedError;

  /// Serializes this CreateOrderRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateOrderRequestCopyWith<CreateOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderRequestCopyWith<$Res> {
  factory $CreateOrderRequestCopyWith(
          CreateOrderRequest value, $Res Function(CreateOrderRequest) then) =
      _$CreateOrderRequestCopyWithImpl<$Res, CreateOrderRequest>;
  @useResult
  $Res call(
      {String eventId,
      List<OrderItemRequest> items,
      String? promoCode,
      String? paymentMethodId});
}

/// @nodoc
class _$CreateOrderRequestCopyWithImpl<$Res, $Val extends CreateOrderRequest>
    implements $CreateOrderRequestCopyWith<$Res> {
  _$CreateOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? items = null,
    Object? promoCode = freezed,
    Object? paymentMethodId = freezed,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemRequest>,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateOrderRequestImplCopyWith<$Res>
    implements $CreateOrderRequestCopyWith<$Res> {
  factory _$$CreateOrderRequestImplCopyWith(_$CreateOrderRequestImpl value,
          $Res Function(_$CreateOrderRequestImpl) then) =
      __$$CreateOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      List<OrderItemRequest> items,
      String? promoCode,
      String? paymentMethodId});
}

/// @nodoc
class __$$CreateOrderRequestImplCopyWithImpl<$Res>
    extends _$CreateOrderRequestCopyWithImpl<$Res, _$CreateOrderRequestImpl>
    implements _$$CreateOrderRequestImplCopyWith<$Res> {
  __$$CreateOrderRequestImplCopyWithImpl(_$CreateOrderRequestImpl _value,
      $Res Function(_$CreateOrderRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? items = null,
    Object? promoCode = freezed,
    Object? paymentMethodId = freezed,
  }) {
    return _then(_$CreateOrderRequestImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemRequest>,
      promoCode: freezed == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOrderRequestImpl implements _CreateOrderRequest {
  const _$CreateOrderRequestImpl(
      {required this.eventId,
      required final List<OrderItemRequest> items,
      this.promoCode,
      this.paymentMethodId})
      : _items = items;

  factory _$CreateOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOrderRequestImplFromJson(json);

  @override
  final String eventId;
  final List<OrderItemRequest> _items;
  @override
  List<OrderItemRequest> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? promoCode;
  @override
  final String? paymentMethodId;

  @override
  String toString() {
    return 'CreateOrderRequest(eventId: $eventId, items: $items, promoCode: $promoCode, paymentMethodId: $paymentMethodId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderRequestImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId,
      const DeepCollectionEquality().hash(_items), promoCode, paymentMethodId);

  /// Create a copy of CreateOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderRequestImplCopyWith<_$CreateOrderRequestImpl> get copyWith =>
      __$$CreateOrderRequestImplCopyWithImpl<_$CreateOrderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateOrderRequest implements CreateOrderRequest {
  const factory _CreateOrderRequest(
      {required final String eventId,
      required final List<OrderItemRequest> items,
      final String? promoCode,
      final String? paymentMethodId}) = _$CreateOrderRequestImpl;

  factory _CreateOrderRequest.fromJson(Map<String, dynamic> json) =
      _$CreateOrderRequestImpl.fromJson;

  @override
  String get eventId;
  @override
  List<OrderItemRequest> get items;
  @override
  String? get promoCode;
  @override
  String? get paymentMethodId;

  /// Create a copy of CreateOrderRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOrderRequestImplCopyWith<_$CreateOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemRequest _$OrderItemRequestFromJson(Map<String, dynamic> json) {
  return _OrderItemRequest.fromJson(json);
}

/// @nodoc
mixin _$OrderItemRequest {
  String get ticketTypeId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this OrderItemRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemRequestCopyWith<OrderItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemRequestCopyWith<$Res> {
  factory $OrderItemRequestCopyWith(
          OrderItemRequest value, $Res Function(OrderItemRequest) then) =
      _$OrderItemRequestCopyWithImpl<$Res, OrderItemRequest>;
  @useResult
  $Res call({String ticketTypeId, int quantity});
}

/// @nodoc
class _$OrderItemRequestCopyWithImpl<$Res, $Val extends OrderItemRequest>
    implements $OrderItemRequestCopyWith<$Res> {
  _$OrderItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketTypeId = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemRequestImplCopyWith<$Res>
    implements $OrderItemRequestCopyWith<$Res> {
  factory _$$OrderItemRequestImplCopyWith(_$OrderItemRequestImpl value,
          $Res Function(_$OrderItemRequestImpl) then) =
      __$$OrderItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ticketTypeId, int quantity});
}

/// @nodoc
class __$$OrderItemRequestImplCopyWithImpl<$Res>
    extends _$OrderItemRequestCopyWithImpl<$Res, _$OrderItemRequestImpl>
    implements _$$OrderItemRequestImplCopyWith<$Res> {
  __$$OrderItemRequestImplCopyWithImpl(_$OrderItemRequestImpl _value,
      $Res Function(_$OrderItemRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketTypeId = null,
    Object? quantity = null,
  }) {
    return _then(_$OrderItemRequestImpl(
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemRequestImpl implements _OrderItemRequest {
  const _$OrderItemRequestImpl(
      {required this.ticketTypeId, required this.quantity});

  factory _$OrderItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemRequestImplFromJson(json);

  @override
  final String ticketTypeId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'OrderItemRequest(ticketTypeId: $ticketTypeId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemRequestImpl &&
            (identical(other.ticketTypeId, ticketTypeId) ||
                other.ticketTypeId == ticketTypeId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ticketTypeId, quantity);

  /// Create a copy of OrderItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemRequestImplCopyWith<_$OrderItemRequestImpl> get copyWith =>
      __$$OrderItemRequestImplCopyWithImpl<_$OrderItemRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemRequestImplToJson(
      this,
    );
  }
}

abstract class _OrderItemRequest implements OrderItemRequest {
  const factory _OrderItemRequest(
      {required final String ticketTypeId,
      required final int quantity}) = _$OrderItemRequestImpl;

  factory _OrderItemRequest.fromJson(Map<String, dynamic> json) =
      _$OrderItemRequestImpl.fromJson;

  @override
  String get ticketTypeId;
  @override
  int get quantity;

  /// Create a copy of OrderItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemRequestImplCopyWith<_$OrderItemRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransferTicketRequest _$TransferTicketRequestFromJson(
    Map<String, dynamic> json) {
  return _TransferTicketRequest.fromJson(json);
}

/// @nodoc
mixin _$TransferTicketRequest {
  String get recipientEmail => throw _privateConstructorUsedError;

  /// Serializes this TransferTicketRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransferTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferTicketRequestCopyWith<TransferTicketRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferTicketRequestCopyWith<$Res> {
  factory $TransferTicketRequestCopyWith(TransferTicketRequest value,
          $Res Function(TransferTicketRequest) then) =
      _$TransferTicketRequestCopyWithImpl<$Res, TransferTicketRequest>;
  @useResult
  $Res call({String recipientEmail});
}

/// @nodoc
class _$TransferTicketRequestCopyWithImpl<$Res,
        $Val extends TransferTicketRequest>
    implements $TransferTicketRequestCopyWith<$Res> {
  _$TransferTicketRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipientEmail = null,
  }) {
    return _then(_value.copyWith(
      recipientEmail: null == recipientEmail
          ? _value.recipientEmail
          : recipientEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferTicketRequestImplCopyWith<$Res>
    implements $TransferTicketRequestCopyWith<$Res> {
  factory _$$TransferTicketRequestImplCopyWith(
          _$TransferTicketRequestImpl value,
          $Res Function(_$TransferTicketRequestImpl) then) =
      __$$TransferTicketRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String recipientEmail});
}

/// @nodoc
class __$$TransferTicketRequestImplCopyWithImpl<$Res>
    extends _$TransferTicketRequestCopyWithImpl<$Res,
        _$TransferTicketRequestImpl>
    implements _$$TransferTicketRequestImplCopyWith<$Res> {
  __$$TransferTicketRequestImplCopyWithImpl(_$TransferTicketRequestImpl _value,
      $Res Function(_$TransferTicketRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipientEmail = null,
  }) {
    return _then(_$TransferTicketRequestImpl(
      recipientEmail: null == recipientEmail
          ? _value.recipientEmail
          : recipientEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferTicketRequestImpl implements _TransferTicketRequest {
  const _$TransferTicketRequestImpl({required this.recipientEmail});

  factory _$TransferTicketRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferTicketRequestImplFromJson(json);

  @override
  final String recipientEmail;

  @override
  String toString() {
    return 'TransferTicketRequest(recipientEmail: $recipientEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferTicketRequestImpl &&
            (identical(other.recipientEmail, recipientEmail) ||
                other.recipientEmail == recipientEmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, recipientEmail);

  /// Create a copy of TransferTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferTicketRequestImplCopyWith<_$TransferTicketRequestImpl>
      get copyWith => __$$TransferTicketRequestImplCopyWithImpl<
          _$TransferTicketRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferTicketRequestImplToJson(
      this,
    );
  }
}

abstract class _TransferTicketRequest implements TransferTicketRequest {
  const factory _TransferTicketRequest({required final String recipientEmail}) =
      _$TransferTicketRequestImpl;

  factory _TransferTicketRequest.fromJson(Map<String, dynamic> json) =
      _$TransferTicketRequestImpl.fromJson;

  @override
  String get recipientEmail;

  /// Create a copy of TransferTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferTicketRequestImplCopyWith<_$TransferTicketRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
