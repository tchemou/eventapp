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
  @JsonKey(name: 'totalAmount')
  double? get totalAmount => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderDate')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  BuyerProfile? get buyer => throw _privateConstructorUsedError;
  List<Ticket>? get tickets => throw _privateConstructorUsedError;
  PaymentInfo? get payment => throw _privateConstructorUsedError;
  String? get appliedPromoCode => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'totalAmount') double? totalAmount,
      String? status,
      @JsonKey(name: 'orderDate') DateTime? createdAt,
      BuyerProfile? buyer,
      List<Ticket>? tickets,
      PaymentInfo? payment,
      String? appliedPromoCode});

  $BuyerProfileCopyWith<$Res>? get buyer;
  $PaymentInfoCopyWith<$Res>? get payment;
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
    Object? totalAmount = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? buyer = freezed,
    Object? tickets = freezed,
    Object? payment = freezed,
    Object? appliedPromoCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      buyer: freezed == buyer
          ? _value.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as BuyerProfile?,
      tickets: freezed == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>?,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentInfo?,
      appliedPromoCode: freezed == appliedPromoCode
          ? _value.appliedPromoCode
          : appliedPromoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuyerProfileCopyWith<$Res>? get buyer {
    if (_value.buyer == null) {
      return null;
    }

    return $BuyerProfileCopyWith<$Res>(_value.buyer!, (value) {
      return _then(_value.copyWith(buyer: value) as $Val);
    });
  }

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentInfoCopyWith<$Res>? get payment {
    if (_value.payment == null) {
      return null;
    }

    return $PaymentInfoCopyWith<$Res>(_value.payment!, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
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
      @JsonKey(name: 'totalAmount') double? totalAmount,
      String? status,
      @JsonKey(name: 'orderDate') DateTime? createdAt,
      BuyerProfile? buyer,
      List<Ticket>? tickets,
      PaymentInfo? payment,
      String? appliedPromoCode});

  @override
  $BuyerProfileCopyWith<$Res>? get buyer;
  @override
  $PaymentInfoCopyWith<$Res>? get payment;
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
    Object? totalAmount = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? buyer = freezed,
    Object? tickets = freezed,
    Object? payment = freezed,
    Object? appliedPromoCode = freezed,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      buyer: freezed == buyer
          ? _value.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as BuyerProfile?,
      tickets: freezed == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket>?,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentInfo?,
      appliedPromoCode: freezed == appliedPromoCode
          ? _value.appliedPromoCode
          : appliedPromoCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.id,
      @JsonKey(name: 'totalAmount') this.totalAmount,
      this.status,
      @JsonKey(name: 'orderDate') this.createdAt,
      this.buyer,
      final List<Ticket>? tickets,
      this.payment,
      this.appliedPromoCode})
      : _tickets = tickets;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'totalAmount')
  final double? totalAmount;
  @override
  final String? status;
  @override
  @JsonKey(name: 'orderDate')
  final DateTime? createdAt;
  @override
  final BuyerProfile? buyer;
  final List<Ticket>? _tickets;
  @override
  List<Ticket>? get tickets {
    final value = _tickets;
    if (value == null) return null;
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PaymentInfo? payment;
  @override
  final String? appliedPromoCode;

  @override
  String toString() {
    return 'Order(id: $id, totalAmount: $totalAmount, status: $status, createdAt: $createdAt, buyer: $buyer, tickets: $tickets, payment: $payment, appliedPromoCode: $appliedPromoCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.buyer, buyer) || other.buyer == buyer) &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.appliedPromoCode, appliedPromoCode) ||
                other.appliedPromoCode == appliedPromoCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      totalAmount,
      status,
      createdAt,
      buyer,
      const DeepCollectionEquality().hash(_tickets),
      payment,
      appliedPromoCode);

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
      @JsonKey(name: 'totalAmount') final double? totalAmount,
      final String? status,
      @JsonKey(name: 'orderDate') final DateTime? createdAt,
      final BuyerProfile? buyer,
      final List<Ticket>? tickets,
      final PaymentInfo? payment,
      final String? appliedPromoCode}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'totalAmount')
  double? get totalAmount;
  @override
  String? get status;
  @override
  @JsonKey(name: 'orderDate')
  DateTime? get createdAt;
  @override
  BuyerProfile? get buyer;
  @override
  List<Ticket>? get tickets;
  @override
  PaymentInfo? get payment;
  @override
  String? get appliedPromoCode;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BuyerProfile _$BuyerProfileFromJson(Map<String, dynamic> json) {
  return _BuyerProfile.fromJson(json);
}

/// @nodoc
mixin _$BuyerProfile {
  String? get fullName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get neighborhood => throw _privateConstructorUsedError;

  /// Serializes this BuyerProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuyerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuyerProfileCopyWith<BuyerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyerProfileCopyWith<$Res> {
  factory $BuyerProfileCopyWith(
          BuyerProfile value, $Res Function(BuyerProfile) then) =
      _$BuyerProfileCopyWithImpl<$Res, BuyerProfile>;
  @useResult
  $Res call(
      {String? fullName,
      String? email,
      String? phoneNumber,
      String? city,
      String? neighborhood});
}

/// @nodoc
class _$BuyerProfileCopyWithImpl<$Res, $Val extends BuyerProfile>
    implements $BuyerProfileCopyWith<$Res> {
  _$BuyerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BuyerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? city = freezed,
    Object? neighborhood = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      neighborhood: freezed == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuyerProfileImplCopyWith<$Res>
    implements $BuyerProfileCopyWith<$Res> {
  factory _$$BuyerProfileImplCopyWith(
          _$BuyerProfileImpl value, $Res Function(_$BuyerProfileImpl) then) =
      __$$BuyerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? fullName,
      String? email,
      String? phoneNumber,
      String? city,
      String? neighborhood});
}

/// @nodoc
class __$$BuyerProfileImplCopyWithImpl<$Res>
    extends _$BuyerProfileCopyWithImpl<$Res, _$BuyerProfileImpl>
    implements _$$BuyerProfileImplCopyWith<$Res> {
  __$$BuyerProfileImplCopyWithImpl(
      _$BuyerProfileImpl _value, $Res Function(_$BuyerProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of BuyerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? city = freezed,
    Object? neighborhood = freezed,
  }) {
    return _then(_$BuyerProfileImpl(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      neighborhood: freezed == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuyerProfileImpl implements _BuyerProfile {
  const _$BuyerProfileImpl(
      {this.fullName,
      this.email,
      this.phoneNumber,
      this.city,
      this.neighborhood});

  factory _$BuyerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuyerProfileImplFromJson(json);

  @override
  final String? fullName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? city;
  @override
  final String? neighborhood;

  @override
  String toString() {
    return 'BuyerProfile(fullName: $fullName, email: $email, phoneNumber: $phoneNumber, city: $city, neighborhood: $neighborhood)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyerProfileImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, fullName, email, phoneNumber, city, neighborhood);

  /// Create a copy of BuyerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyerProfileImplCopyWith<_$BuyerProfileImpl> get copyWith =>
      __$$BuyerProfileImplCopyWithImpl<_$BuyerProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuyerProfileImplToJson(
      this,
    );
  }
}

abstract class _BuyerProfile implements BuyerProfile {
  const factory _BuyerProfile(
      {final String? fullName,
      final String? email,
      final String? phoneNumber,
      final String? city,
      final String? neighborhood}) = _$BuyerProfileImpl;

  factory _BuyerProfile.fromJson(Map<String, dynamic> json) =
      _$BuyerProfileImpl.fromJson;

  @override
  String? get fullName;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get city;
  @override
  String? get neighborhood;

  /// Create a copy of BuyerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuyerProfileImplCopyWith<_$BuyerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TicketTypeInfo _$TicketTypeInfoFromJson(Map<String, dynamic> json) {
  return _TicketTypeInfo.fromJson(json);
}

/// @nodoc
mixin _$TicketTypeInfo {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get availableQuantity => throw _privateConstructorUsedError;
  int? get soldQuantity => throw _privateConstructorUsedError;
  bool? get isVisible => throw _privateConstructorUsedError;
  bool? get isFree => throw _privateConstructorUsedError;

  /// Serializes this TicketTypeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketTypeInfoCopyWith<TicketTypeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketTypeInfoCopyWith<$Res> {
  factory $TicketTypeInfoCopyWith(
          TicketTypeInfo value, $Res Function(TicketTypeInfo) then) =
      _$TicketTypeInfoCopyWithImpl<$Res, TicketTypeInfo>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      double? price,
      int? availableQuantity,
      int? soldQuantity,
      bool? isVisible,
      bool? isFree});
}

/// @nodoc
class _$TicketTypeInfoCopyWithImpl<$Res, $Val extends TicketTypeInfo>
    implements $TicketTypeInfoCopyWith<$Res> {
  _$TicketTypeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? availableQuantity = freezed,
    Object? soldQuantity = freezed,
    Object? isVisible = freezed,
    Object? isFree = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      availableQuantity: freezed == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      soldQuantity: freezed == soldQuantity
          ? _value.soldQuantity
          : soldQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isVisible: freezed == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFree: freezed == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketTypeInfoImplCopyWith<$Res>
    implements $TicketTypeInfoCopyWith<$Res> {
  factory _$$TicketTypeInfoImplCopyWith(_$TicketTypeInfoImpl value,
          $Res Function(_$TicketTypeInfoImpl) then) =
      __$$TicketTypeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      double? price,
      int? availableQuantity,
      int? soldQuantity,
      bool? isVisible,
      bool? isFree});
}

/// @nodoc
class __$$TicketTypeInfoImplCopyWithImpl<$Res>
    extends _$TicketTypeInfoCopyWithImpl<$Res, _$TicketTypeInfoImpl>
    implements _$$TicketTypeInfoImplCopyWith<$Res> {
  __$$TicketTypeInfoImplCopyWithImpl(
      _$TicketTypeInfoImpl _value, $Res Function(_$TicketTypeInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? availableQuantity = freezed,
    Object? soldQuantity = freezed,
    Object? isVisible = freezed,
    Object? isFree = freezed,
  }) {
    return _then(_$TicketTypeInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      availableQuantity: freezed == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      soldQuantity: freezed == soldQuantity
          ? _value.soldQuantity
          : soldQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isVisible: freezed == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFree: freezed == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketTypeInfoImpl implements _TicketTypeInfo {
  const _$TicketTypeInfoImpl(
      {this.id,
      this.name,
      this.price,
      this.availableQuantity,
      this.soldQuantity,
      this.isVisible,
      this.isFree});

  factory _$TicketTypeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketTypeInfoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final double? price;
  @override
  final int? availableQuantity;
  @override
  final int? soldQuantity;
  @override
  final bool? isVisible;
  @override
  final bool? isFree;

  @override
  String toString() {
    return 'TicketTypeInfo(id: $id, name: $name, price: $price, availableQuantity: $availableQuantity, soldQuantity: $soldQuantity, isVisible: $isVisible, isFree: $isFree)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketTypeInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.availableQuantity, availableQuantity) ||
                other.availableQuantity == availableQuantity) &&
            (identical(other.soldQuantity, soldQuantity) ||
                other.soldQuantity == soldQuantity) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.isFree, isFree) || other.isFree == isFree));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price,
      availableQuantity, soldQuantity, isVisible, isFree);

  /// Create a copy of TicketTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketTypeInfoImplCopyWith<_$TicketTypeInfoImpl> get copyWith =>
      __$$TicketTypeInfoImplCopyWithImpl<_$TicketTypeInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketTypeInfoImplToJson(
      this,
    );
  }
}

abstract class _TicketTypeInfo implements TicketTypeInfo {
  const factory _TicketTypeInfo(
      {final String? id,
      final String? name,
      final double? price,
      final int? availableQuantity,
      final int? soldQuantity,
      final bool? isVisible,
      final bool? isFree}) = _$TicketTypeInfoImpl;

  factory _TicketTypeInfo.fromJson(Map<String, dynamic> json) =
      _$TicketTypeInfoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  double? get price;
  @override
  int? get availableQuantity;
  @override
  int? get soldQuantity;
  @override
  bool? get isVisible;
  @override
  bool? get isFree;

  /// Create a copy of TicketTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketTypeInfoImplCopyWith<_$TicketTypeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  String get id => throw _privateConstructorUsedError;
  String? get qrCode => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  DateTime? get purchaseDate => throw _privateConstructorUsedError;
  String? get participantName => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool? get nominal => throw _privateConstructorUsedError;
  @JsonKey(name: 'ticketType')
  TicketTypeInfo? get ticketType => throw _privateConstructorUsedError;

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
      String? qrCode,
      String? status,
      DateTime? purchaseDate,
      String? participantName,
      DateTime? createdAt,
      bool? nominal,
      @JsonKey(name: 'ticketType') TicketTypeInfo? ticketType});

  $TicketTypeInfoCopyWith<$Res>? get ticketType;
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
    Object? qrCode = freezed,
    Object? status = freezed,
    Object? purchaseDate = freezed,
    Object? participantName = freezed,
    Object? createdAt = freezed,
    Object? nominal = freezed,
    Object? ticketType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseDate: freezed == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      participantName: freezed == participantName
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nominal: freezed == nominal
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as bool?,
      ticketType: freezed == ticketType
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as TicketTypeInfo?,
    ) as $Val);
  }

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketTypeInfoCopyWith<$Res>? get ticketType {
    if (_value.ticketType == null) {
      return null;
    }

    return $TicketTypeInfoCopyWith<$Res>(_value.ticketType!, (value) {
      return _then(_value.copyWith(ticketType: value) as $Val);
    });
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
      String? qrCode,
      String? status,
      DateTime? purchaseDate,
      String? participantName,
      DateTime? createdAt,
      bool? nominal,
      @JsonKey(name: 'ticketType') TicketTypeInfo? ticketType});

  @override
  $TicketTypeInfoCopyWith<$Res>? get ticketType;
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
    Object? qrCode = freezed,
    Object? status = freezed,
    Object? purchaseDate = freezed,
    Object? participantName = freezed,
    Object? createdAt = freezed,
    Object? nominal = freezed,
    Object? ticketType = freezed,
  }) {
    return _then(_$TicketImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      qrCode: freezed == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseDate: freezed == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      participantName: freezed == participantName
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nominal: freezed == nominal
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as bool?,
      ticketType: freezed == ticketType
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as TicketTypeInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketImpl implements _Ticket {
  const _$TicketImpl(
      {required this.id,
      this.qrCode,
      this.status,
      this.purchaseDate,
      this.participantName,
      this.createdAt,
      this.nominal,
      @JsonKey(name: 'ticketType') this.ticketType});

  factory _$TicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketImplFromJson(json);

  @override
  final String id;
  @override
  final String? qrCode;
  @override
  final String? status;
  @override
  final DateTime? purchaseDate;
  @override
  final String? participantName;
  @override
  final DateTime? createdAt;
  @override
  final bool? nominal;
  @override
  @JsonKey(name: 'ticketType')
  final TicketTypeInfo? ticketType;

  @override
  String toString() {
    return 'Ticket(id: $id, qrCode: $qrCode, status: $status, purchaseDate: $purchaseDate, participantName: $participantName, createdAt: $createdAt, nominal: $nominal, ticketType: $ticketType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.participantName, participantName) ||
                other.participantName == participantName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.nominal, nominal) || other.nominal == nominal) &&
            (identical(other.ticketType, ticketType) ||
                other.ticketType == ticketType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, qrCode, status, purchaseDate,
      participantName, createdAt, nominal, ticketType);

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
          final String? qrCode,
          final String? status,
          final DateTime? purchaseDate,
          final String? participantName,
          final DateTime? createdAt,
          final bool? nominal,
          @JsonKey(name: 'ticketType') final TicketTypeInfo? ticketType}) =
      _$TicketImpl;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$TicketImpl.fromJson;

  @override
  String get id;
  @override
  String? get qrCode;
  @override
  String? get status;
  @override
  DateTime? get purchaseDate;
  @override
  String? get participantName;
  @override
  DateTime? get createdAt;
  @override
  bool? get nominal;
  @override
  @JsonKey(name: 'ticketType')
  TicketTypeInfo? get ticketType;

  /// Create a copy of Ticket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentInfo _$PaymentInfoFromJson(Map<String, dynamic> json) {
  return _PaymentInfo.fromJson(json);
}

/// @nodoc
mixin _$PaymentInfo {
  String? get id => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  DateTime? get paymentDate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get transactionReference => throw _privateConstructorUsedError;

  /// Serializes this PaymentInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentInfoCopyWith<PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoCopyWith<$Res> {
  factory $PaymentInfoCopyWith(
          PaymentInfo value, $Res Function(PaymentInfo) then) =
      _$PaymentInfoCopyWithImpl<$Res, PaymentInfo>;
  @useResult
  $Res call(
      {String? id,
      double? amount,
      String? currency,
      DateTime? paymentDate,
      String? status,
      String? paymentMethod,
      String? transactionReference});
}

/// @nodoc
class _$PaymentInfoCopyWithImpl<$Res, $Val extends PaymentInfo>
    implements $PaymentInfoCopyWith<$Res> {
  _$PaymentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? paymentDate = freezed,
    Object? status = freezed,
    Object? paymentMethod = freezed,
    Object? transactionReference = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionReference: freezed == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentInfoImplCopyWith<$Res>
    implements $PaymentInfoCopyWith<$Res> {
  factory _$$PaymentInfoImplCopyWith(
          _$PaymentInfoImpl value, $Res Function(_$PaymentInfoImpl) then) =
      __$$PaymentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      double? amount,
      String? currency,
      DateTime? paymentDate,
      String? status,
      String? paymentMethod,
      String? transactionReference});
}

/// @nodoc
class __$$PaymentInfoImplCopyWithImpl<$Res>
    extends _$PaymentInfoCopyWithImpl<$Res, _$PaymentInfoImpl>
    implements _$$PaymentInfoImplCopyWith<$Res> {
  __$$PaymentInfoImplCopyWithImpl(
      _$PaymentInfoImpl _value, $Res Function(_$PaymentInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? currency = freezed,
    Object? paymentDate = freezed,
    Object? status = freezed,
    Object? paymentMethod = freezed,
    Object? transactionReference = freezed,
  }) {
    return _then(_$PaymentInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionReference: freezed == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentInfoImpl implements _PaymentInfo {
  const _$PaymentInfoImpl(
      {this.id,
      this.amount,
      this.currency,
      this.paymentDate,
      this.status,
      this.paymentMethod,
      this.transactionReference});

  factory _$PaymentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentInfoImplFromJson(json);

  @override
  final String? id;
  @override
  final double? amount;
  @override
  final String? currency;
  @override
  final DateTime? paymentDate;
  @override
  final String? status;
  @override
  final String? paymentMethod;
  @override
  final String? transactionReference;

  @override
  String toString() {
    return 'PaymentInfo(id: $id, amount: $amount, currency: $currency, paymentDate: $paymentDate, status: $status, paymentMethod: $paymentMethod, transactionReference: $transactionReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionReference, transactionReference) ||
                other.transactionReference == transactionReference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, currency,
      paymentDate, status, paymentMethod, transactionReference);

  /// Create a copy of PaymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentInfoImplCopyWith<_$PaymentInfoImpl> get copyWith =>
      __$$PaymentInfoImplCopyWithImpl<_$PaymentInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentInfoImplToJson(
      this,
    );
  }
}

abstract class _PaymentInfo implements PaymentInfo {
  const factory _PaymentInfo(
      {final String? id,
      final double? amount,
      final String? currency,
      final DateTime? paymentDate,
      final String? status,
      final String? paymentMethod,
      final String? transactionReference}) = _$PaymentInfoImpl;

  factory _PaymentInfo.fromJson(Map<String, dynamic> json) =
      _$PaymentInfoImpl.fromJson;

  @override
  String? get id;
  @override
  double? get amount;
  @override
  String? get currency;
  @override
  DateTime? get paymentDate;
  @override
  String? get status;
  @override
  String? get paymentMethod;
  @override
  String? get transactionReference;

  /// Create a copy of PaymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentInfoImplCopyWith<_$PaymentInfoImpl> get copyWith =>
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
  String get newParticipantName => throw _privateConstructorUsedError;

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
  $Res call({String newParticipantName});
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
    Object? newParticipantName = null,
  }) {
    return _then(_value.copyWith(
      newParticipantName: null == newParticipantName
          ? _value.newParticipantName
          : newParticipantName // ignore: cast_nullable_to_non_nullable
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
  $Res call({String newParticipantName});
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
    Object? newParticipantName = null,
  }) {
    return _then(_$TransferTicketRequestImpl(
      newParticipantName: null == newParticipantName
          ? _value.newParticipantName
          : newParticipantName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferTicketRequestImpl implements _TransferTicketRequest {
  const _$TransferTicketRequestImpl({required this.newParticipantName});

  factory _$TransferTicketRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferTicketRequestImplFromJson(json);

  @override
  final String newParticipantName;

  @override
  String toString() {
    return 'TransferTicketRequest(newParticipantName: $newParticipantName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferTicketRequestImpl &&
            (identical(other.newParticipantName, newParticipantName) ||
                other.newParticipantName == newParticipantName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, newParticipantName);

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
  const factory _TransferTicketRequest(
      {required final String newParticipantName}) = _$TransferTicketRequestImpl;

  factory _TransferTicketRequest.fromJson(Map<String, dynamic> json) =
      _$TransferTicketRequestImpl.fromJson;

  @override
  String get newParticipantName;

  /// Create a copy of TransferTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferTicketRequestImplCopyWith<_$TransferTicketRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
