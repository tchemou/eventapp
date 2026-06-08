// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Venue _$VenueFromJson(Map<String, dynamic> json) {
  return _Venue.fromJson(json);
}

/// @nodoc
mixin _$Venue {
  String get id => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get googleMapsUrl => throw _privateConstructorUsedError;
  String? get onlineUrl => throw _privateConstructorUsedError;
  bool? get isOnline => throw _privateConstructorUsedError;

  /// Serializes this Venue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Venue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VenueCopyWith<Venue> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VenueCopyWith<$Res> {
  factory $VenueCopyWith(Venue value, $Res Function(Venue) then) =
      _$VenueCopyWithImpl<$Res, Venue>;
  @useResult
  $Res call(
      {String id,
      String? address,
      String? city,
      String? country,
      String? googleMapsUrl,
      String? onlineUrl,
      bool? isOnline});
}

/// @nodoc
class _$VenueCopyWithImpl<$Res, $Val extends Venue>
    implements $VenueCopyWith<$Res> {
  _$VenueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Venue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? googleMapsUrl = freezed,
    Object? onlineUrl = freezed,
    Object? isOnline = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      googleMapsUrl: freezed == googleMapsUrl
          ? _value.googleMapsUrl
          : googleMapsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      onlineUrl: freezed == onlineUrl
          ? _value.onlineUrl
          : onlineUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VenueImplCopyWith<$Res> implements $VenueCopyWith<$Res> {
  factory _$$VenueImplCopyWith(
          _$VenueImpl value, $Res Function(_$VenueImpl) then) =
      __$$VenueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? address,
      String? city,
      String? country,
      String? googleMapsUrl,
      String? onlineUrl,
      bool? isOnline});
}

/// @nodoc
class __$$VenueImplCopyWithImpl<$Res>
    extends _$VenueCopyWithImpl<$Res, _$VenueImpl>
    implements _$$VenueImplCopyWith<$Res> {
  __$$VenueImplCopyWithImpl(
      _$VenueImpl _value, $Res Function(_$VenueImpl) _then)
      : super(_value, _then);

  /// Create a copy of Venue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? googleMapsUrl = freezed,
    Object? onlineUrl = freezed,
    Object? isOnline = freezed,
  }) {
    return _then(_$VenueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      googleMapsUrl: freezed == googleMapsUrl
          ? _value.googleMapsUrl
          : googleMapsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      onlineUrl: freezed == onlineUrl
          ? _value.onlineUrl
          : onlineUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VenueImpl implements _Venue {
  const _$VenueImpl(
      {required this.id,
      this.address,
      this.city,
      this.country,
      this.googleMapsUrl,
      this.onlineUrl,
      this.isOnline});

  factory _$VenueImpl.fromJson(Map<String, dynamic> json) =>
      _$$VenueImplFromJson(json);

  @override
  final String id;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? country;
  @override
  final String? googleMapsUrl;
  @override
  final String? onlineUrl;
  @override
  final bool? isOnline;

  @override
  String toString() {
    return 'Venue(id: $id, address: $address, city: $city, country: $country, googleMapsUrl: $googleMapsUrl, onlineUrl: $onlineUrl, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VenueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.googleMapsUrl, googleMapsUrl) ||
                other.googleMapsUrl == googleMapsUrl) &&
            (identical(other.onlineUrl, onlineUrl) ||
                other.onlineUrl == onlineUrl) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, address, city, country,
      googleMapsUrl, onlineUrl, isOnline);

  /// Create a copy of Venue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VenueImplCopyWith<_$VenueImpl> get copyWith =>
      __$$VenueImplCopyWithImpl<_$VenueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VenueImplToJson(
      this,
    );
  }
}

abstract class _Venue implements Venue {
  const factory _Venue(
      {required final String id,
      final String? address,
      final String? city,
      final String? country,
      final String? googleMapsUrl,
      final String? onlineUrl,
      final bool? isOnline}) = _$VenueImpl;

  factory _Venue.fromJson(Map<String, dynamic> json) = _$VenueImpl.fromJson;

  @override
  String get id;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get country;
  @override
  String? get googleMapsUrl;
  @override
  String? get onlineUrl;
  @override
  bool? get isOnline;

  /// Create a copy of Venue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VenueImplCopyWith<_$VenueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Organizer _$OrganizerFromJson(Map<String, dynamic> json) {
  return _Organizer.fromJson(json);
}

/// @nodoc
mixin _$Organizer {
  String? get logo => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get socialNetworks => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;

  /// Serializes this Organizer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Organizer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganizerCopyWith<Organizer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizerCopyWith<$Res> {
  factory $OrganizerCopyWith(Organizer value, $Res Function(Organizer) then) =
      _$OrganizerCopyWithImpl<$Res, Organizer>;
  @useResult
  $Res call(
      {String? logo,
      String? description,
      List<String>? socialNetworks,
      String? fullName,
      String? email,
      String? phoneNumber,
      String? city});
}

/// @nodoc
class _$OrganizerCopyWithImpl<$Res, $Val extends Organizer>
    implements $OrganizerCopyWith<$Res> {
  _$OrganizerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Organizer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = freezed,
    Object? description = freezed,
    Object? socialNetworks = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? city = freezed,
  }) {
    return _then(_value.copyWith(
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      socialNetworks: freezed == socialNetworks
          ? _value.socialNetworks
          : socialNetworks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrganizerImplCopyWith<$Res>
    implements $OrganizerCopyWith<$Res> {
  factory _$$OrganizerImplCopyWith(
          _$OrganizerImpl value, $Res Function(_$OrganizerImpl) then) =
      __$$OrganizerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? logo,
      String? description,
      List<String>? socialNetworks,
      String? fullName,
      String? email,
      String? phoneNumber,
      String? city});
}

/// @nodoc
class __$$OrganizerImplCopyWithImpl<$Res>
    extends _$OrganizerCopyWithImpl<$Res, _$OrganizerImpl>
    implements _$$OrganizerImplCopyWith<$Res> {
  __$$OrganizerImplCopyWithImpl(
      _$OrganizerImpl _value, $Res Function(_$OrganizerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Organizer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = freezed,
    Object? description = freezed,
    Object? socialNetworks = freezed,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? city = freezed,
  }) {
    return _then(_$OrganizerImpl(
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      socialNetworks: freezed == socialNetworks
          ? _value._socialNetworks
          : socialNetworks // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganizerImpl implements _Organizer {
  const _$OrganizerImpl(
      {this.logo,
      this.description,
      final List<String>? socialNetworks,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.city})
      : _socialNetworks = socialNetworks;

  factory _$OrganizerImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizerImplFromJson(json);

  @override
  final String? logo;
  @override
  final String? description;
  final List<String>? _socialNetworks;
  @override
  List<String>? get socialNetworks {
    final value = _socialNetworks;
    if (value == null) return null;
    if (_socialNetworks is EqualUnmodifiableListView) return _socialNetworks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? fullName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? city;

  @override
  String toString() {
    return 'Organizer(logo: $logo, description: $description, socialNetworks: $socialNetworks, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizerImpl &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._socialNetworks, _socialNetworks) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      logo,
      description,
      const DeepCollectionEquality().hash(_socialNetworks),
      fullName,
      email,
      phoneNumber,
      city);

  /// Create a copy of Organizer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizerImplCopyWith<_$OrganizerImpl> get copyWith =>
      __$$OrganizerImplCopyWithImpl<_$OrganizerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizerImplToJson(
      this,
    );
  }
}

abstract class _Organizer implements Organizer {
  const factory _Organizer(
      {final String? logo,
      final String? description,
      final List<String>? socialNetworks,
      final String? fullName,
      final String? email,
      final String? phoneNumber,
      final String? city}) = _$OrganizerImpl;

  factory _Organizer.fromJson(Map<String, dynamic> json) =
      _$OrganizerImpl.fromJson;

  @override
  String? get logo;
  @override
  String? get description;
  @override
  List<String>? get socialNetworks;
  @override
  String? get fullName;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get city;

  /// Create a copy of Organizer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganizerImplCopyWith<_$OrganizerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TicketType _$TicketTypeFromJson(Map<String, dynamic> json) {
  return _TicketType.fromJson(json);
}

/// @nodoc
mixin _$TicketType {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int? get availableQuantity => throw _privateConstructorUsedError;
  int? get soldQuantity => throw _privateConstructorUsedError;
  String? get saleStartDate => throw _privateConstructorUsedError;
  String? get saleEndDate => throw _privateConstructorUsedError;
  int? get limitPerPerson => throw _privateConstructorUsedError;
  bool? get isVisible => throw _privateConstructorUsedError;
  bool? get isFree => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;

  /// Serializes this TicketType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketTypeCopyWith<TicketType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketTypeCopyWith<$Res> {
  factory $TicketTypeCopyWith(
          TicketType value, $Res Function(TicketType) then) =
      _$TicketTypeCopyWithImpl<$Res, TicketType>;
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      int? availableQuantity,
      int? soldQuantity,
      String? saleStartDate,
      String? saleEndDate,
      int? limitPerPerson,
      bool? isVisible,
      bool? isFree,
      String? eventId});
}

/// @nodoc
class _$TicketTypeCopyWithImpl<$Res, $Val extends TicketType>
    implements $TicketTypeCopyWith<$Res> {
  _$TicketTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? availableQuantity = freezed,
    Object? soldQuantity = freezed,
    Object? saleStartDate = freezed,
    Object? saleEndDate = freezed,
    Object? limitPerPerson = freezed,
    Object? isVisible = freezed,
    Object? isFree = freezed,
    Object? eventId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      availableQuantity: freezed == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      soldQuantity: freezed == soldQuantity
          ? _value.soldQuantity
          : soldQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      saleStartDate: freezed == saleStartDate
          ? _value.saleStartDate
          : saleStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      saleEndDate: freezed == saleEndDate
          ? _value.saleEndDate
          : saleEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      limitPerPerson: freezed == limitPerPerson
          ? _value.limitPerPerson
          : limitPerPerson // ignore: cast_nullable_to_non_nullable
              as int?,
      isVisible: freezed == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFree: freezed == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketTypeImplCopyWith<$Res>
    implements $TicketTypeCopyWith<$Res> {
  factory _$$TicketTypeImplCopyWith(
          _$TicketTypeImpl value, $Res Function(_$TicketTypeImpl) then) =
      __$$TicketTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      int? availableQuantity,
      int? soldQuantity,
      String? saleStartDate,
      String? saleEndDate,
      int? limitPerPerson,
      bool? isVisible,
      bool? isFree,
      String? eventId});
}

/// @nodoc
class __$$TicketTypeImplCopyWithImpl<$Res>
    extends _$TicketTypeCopyWithImpl<$Res, _$TicketTypeImpl>
    implements _$$TicketTypeImplCopyWith<$Res> {
  __$$TicketTypeImplCopyWithImpl(
      _$TicketTypeImpl _value, $Res Function(_$TicketTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? availableQuantity = freezed,
    Object? soldQuantity = freezed,
    Object? saleStartDate = freezed,
    Object? saleEndDate = freezed,
    Object? limitPerPerson = freezed,
    Object? isVisible = freezed,
    Object? isFree = freezed,
    Object? eventId = freezed,
  }) {
    return _then(_$TicketTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      availableQuantity: freezed == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      soldQuantity: freezed == soldQuantity
          ? _value.soldQuantity
          : soldQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      saleStartDate: freezed == saleStartDate
          ? _value.saleStartDate
          : saleStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      saleEndDate: freezed == saleEndDate
          ? _value.saleEndDate
          : saleEndDate // ignore: cast_nullable_to_non_nullable
              as String?,
      limitPerPerson: freezed == limitPerPerson
          ? _value.limitPerPerson
          : limitPerPerson // ignore: cast_nullable_to_non_nullable
              as int?,
      isVisible: freezed == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFree: freezed == isFree
          ? _value.isFree
          : isFree // ignore: cast_nullable_to_non_nullable
              as bool?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketTypeImpl implements _TicketType {
  const _$TicketTypeImpl(
      {required this.id,
      required this.name,
      required this.price,
      this.availableQuantity,
      this.soldQuantity,
      this.saleStartDate,
      this.saleEndDate,
      this.limitPerPerson,
      this.isVisible,
      this.isFree,
      this.eventId});

  factory _$TicketTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketTypeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final int? availableQuantity;
  @override
  final int? soldQuantity;
  @override
  final String? saleStartDate;
  @override
  final String? saleEndDate;
  @override
  final int? limitPerPerson;
  @override
  final bool? isVisible;
  @override
  final bool? isFree;
  @override
  final String? eventId;

  @override
  String toString() {
    return 'TicketType(id: $id, name: $name, price: $price, availableQuantity: $availableQuantity, soldQuantity: $soldQuantity, saleStartDate: $saleStartDate, saleEndDate: $saleEndDate, limitPerPerson: $limitPerPerson, isVisible: $isVisible, isFree: $isFree, eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.availableQuantity, availableQuantity) ||
                other.availableQuantity == availableQuantity) &&
            (identical(other.soldQuantity, soldQuantity) ||
                other.soldQuantity == soldQuantity) &&
            (identical(other.saleStartDate, saleStartDate) ||
                other.saleStartDate == saleStartDate) &&
            (identical(other.saleEndDate, saleEndDate) ||
                other.saleEndDate == saleEndDate) &&
            (identical(other.limitPerPerson, limitPerPerson) ||
                other.limitPerPerson == limitPerPerson) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      price,
      availableQuantity,
      soldQuantity,
      saleStartDate,
      saleEndDate,
      limitPerPerson,
      isVisible,
      isFree,
      eventId);

  /// Create a copy of TicketType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketTypeImplCopyWith<_$TicketTypeImpl> get copyWith =>
      __$$TicketTypeImplCopyWithImpl<_$TicketTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketTypeImplToJson(
      this,
    );
  }
}

abstract class _TicketType implements TicketType {
  const factory _TicketType(
      {required final String id,
      required final String name,
      required final double price,
      final int? availableQuantity,
      final int? soldQuantity,
      final String? saleStartDate,
      final String? saleEndDate,
      final int? limitPerPerson,
      final bool? isVisible,
      final bool? isFree,
      final String? eventId}) = _$TicketTypeImpl;

  factory _TicketType.fromJson(Map<String, dynamic> json) =
      _$TicketTypeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  int? get availableQuantity;
  @override
  int? get soldQuantity;
  @override
  String? get saleStartDate;
  @override
  String? get saleEndDate;
  @override
  int? get limitPerPerson;
  @override
  bool? get isVisible;
  @override
  bool? get isFree;
  @override
  String? get eventId;

  /// Create a copy of TicketType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketTypeImplCopyWith<_$TicketTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  List<String>? get languages => throw _privateConstructorUsedError;
  String? get status =>
      throw _privateConstructorUsedError; // ✅ API envoie startDate / endDate
  @JsonKey(name: 'startDate')
  DateTime? get eventDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'endDate')
  DateTime? get eventEndDate => throw _privateConstructorUsedError;
  int? get maxCapacity =>
      throw _privateConstructorUsedError; // ✅ API envoie coverImageUrl
  @JsonKey(name: 'coverImageUrl')
  String? get imageUrl =>
      throw _privateConstructorUsedError; // ✅ venue est un objet
  Venue? get venue => throw _privateConstructorUsedError;
  Organizer? get organizer => throw _privateConstructorUsedError;
  List<TicketType>? get ticketTypes => throw _privateConstructorUsedError;
  int? get availableTicketsCount => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool? get isPrivate => throw _privateConstructorUsedError;
  bool? get isFavorite => throw _privateConstructorUsedError;
  String? get locationDetails => throw _privateConstructorUsedError;

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String? category,
      List<String>? tags,
      List<String>? languages,
      String? status,
      @JsonKey(name: 'startDate') DateTime? eventDate,
      @JsonKey(name: 'endDate') DateTime? eventEndDate,
      int? maxCapacity,
      @JsonKey(name: 'coverImageUrl') String? imageUrl,
      Venue? venue,
      Organizer? organizer,
      List<TicketType>? ticketTypes,
      int? availableTicketsCount,
      DateTime? createdAt,
      bool? isPrivate,
      bool? isFavorite,
      String? locationDetails});

  $VenueCopyWith<$Res>? get venue;
  $OrganizerCopyWith<$Res>? get organizer;
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? category = freezed,
    Object? tags = freezed,
    Object? languages = freezed,
    Object? status = freezed,
    Object? eventDate = freezed,
    Object? eventEndDate = freezed,
    Object? maxCapacity = freezed,
    Object? imageUrl = freezed,
    Object? venue = freezed,
    Object? organizer = freezed,
    Object? ticketTypes = freezed,
    Object? availableTicketsCount = freezed,
    Object? createdAt = freezed,
    Object? isPrivate = freezed,
    Object? isFavorite = freezed,
    Object? locationDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDate: freezed == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventEndDate: freezed == eventEndDate
          ? _value.eventEndDate
          : eventEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maxCapacity: freezed == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as Venue?,
      organizer: freezed == organizer
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as Organizer?,
      ticketTypes: freezed == ticketTypes
          ? _value.ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<TicketType>?,
      availableTicketsCount: freezed == availableTicketsCount
          ? _value.availableTicketsCount
          : availableTicketsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VenueCopyWith<$Res>? get venue {
    if (_value.venue == null) {
      return null;
    }

    return $VenueCopyWith<$Res>(_value.venue!, (value) {
      return _then(_value.copyWith(venue: value) as $Val);
    });
  }

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizerCopyWith<$Res>? get organizer {
    if (_value.organizer == null) {
      return null;
    }

    return $OrganizerCopyWith<$Res>(_value.organizer!, (value) {
      return _then(_value.copyWith(organizer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      String? category,
      List<String>? tags,
      List<String>? languages,
      String? status,
      @JsonKey(name: 'startDate') DateTime? eventDate,
      @JsonKey(name: 'endDate') DateTime? eventEndDate,
      int? maxCapacity,
      @JsonKey(name: 'coverImageUrl') String? imageUrl,
      Venue? venue,
      Organizer? organizer,
      List<TicketType>? ticketTypes,
      int? availableTicketsCount,
      DateTime? createdAt,
      bool? isPrivate,
      bool? isFavorite,
      String? locationDetails});

  @override
  $VenueCopyWith<$Res>? get venue;
  @override
  $OrganizerCopyWith<$Res>? get organizer;
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? category = freezed,
    Object? tags = freezed,
    Object? languages = freezed,
    Object? status = freezed,
    Object? eventDate = freezed,
    Object? eventEndDate = freezed,
    Object? maxCapacity = freezed,
    Object? imageUrl = freezed,
    Object? venue = freezed,
    Object? organizer = freezed,
    Object? ticketTypes = freezed,
    Object? availableTicketsCount = freezed,
    Object? createdAt = freezed,
    Object? isPrivate = freezed,
    Object? isFavorite = freezed,
    Object? locationDetails = freezed,
  }) {
    return _then(_$EventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDate: freezed == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventEndDate: freezed == eventEndDate
          ? _value.eventEndDate
          : eventEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      maxCapacity: freezed == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as Venue?,
      organizer: freezed == organizer
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as Organizer?,
      ticketTypes: freezed == ticketTypes
          ? _value._ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<TicketType>?,
      availableTicketsCount: freezed == availableTicketsCount
          ? _value.availableTicketsCount
          : availableTicketsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventImpl implements _Event {
  const _$EventImpl(
      {required this.id,
      required this.title,
      this.description,
      this.category,
      final List<String>? tags,
      final List<String>? languages,
      this.status,
      @JsonKey(name: 'startDate') this.eventDate,
      @JsonKey(name: 'endDate') this.eventEndDate,
      this.maxCapacity,
      @JsonKey(name: 'coverImageUrl') this.imageUrl,
      this.venue,
      this.organizer,
      final List<TicketType>? ticketTypes,
      this.availableTicketsCount,
      this.createdAt,
      this.isPrivate,
      this.isFavorite,
      this.locationDetails})
      : _tags = tags,
        _languages = languages,
        _ticketTypes = ticketTypes;

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? category;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _languages;
  @override
  List<String>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
// ✅ API envoie startDate / endDate
  @override
  @JsonKey(name: 'startDate')
  final DateTime? eventDate;
  @override
  @JsonKey(name: 'endDate')
  final DateTime? eventEndDate;
  @override
  final int? maxCapacity;
// ✅ API envoie coverImageUrl
  @override
  @JsonKey(name: 'coverImageUrl')
  final String? imageUrl;
// ✅ venue est un objet
  @override
  final Venue? venue;
  @override
  final Organizer? organizer;
  final List<TicketType>? _ticketTypes;
  @override
  List<TicketType>? get ticketTypes {
    final value = _ticketTypes;
    if (value == null) return null;
    if (_ticketTypes is EqualUnmodifiableListView) return _ticketTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? availableTicketsCount;
  @override
  final DateTime? createdAt;
  @override
  final bool? isPrivate;
  @override
  final bool? isFavorite;
  @override
  final String? locationDetails;

  @override
  String toString() {
    return 'Event(id: $id, title: $title, description: $description, category: $category, tags: $tags, languages: $languages, status: $status, eventDate: $eventDate, eventEndDate: $eventEndDate, maxCapacity: $maxCapacity, imageUrl: $imageUrl, venue: $venue, organizer: $organizer, ticketTypes: $ticketTypes, availableTicketsCount: $availableTicketsCount, createdAt: $createdAt, isPrivate: $isPrivate, isFavorite: $isFavorite, locationDetails: $locationDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.eventEndDate, eventEndDate) ||
                other.eventEndDate == eventEndDate) &&
            (identical(other.maxCapacity, maxCapacity) ||
                other.maxCapacity == maxCapacity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.organizer, organizer) ||
                other.organizer == organizer) &&
            const DeepCollectionEquality()
                .equals(other._ticketTypes, _ticketTypes) &&
            (identical(other.availableTicketsCount, availableTicketsCount) ||
                other.availableTicketsCount == availableTicketsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.locationDetails, locationDetails) ||
                other.locationDetails == locationDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        category,
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_languages),
        status,
        eventDate,
        eventEndDate,
        maxCapacity,
        imageUrl,
        venue,
        organizer,
        const DeepCollectionEquality().hash(_ticketTypes),
        availableTicketsCount,
        createdAt,
        isPrivate,
        isFavorite,
        locationDetails
      ]);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {required final String id,
      required final String title,
      final String? description,
      final String? category,
      final List<String>? tags,
      final List<String>? languages,
      final String? status,
      @JsonKey(name: 'startDate') final DateTime? eventDate,
      @JsonKey(name: 'endDate') final DateTime? eventEndDate,
      final int? maxCapacity,
      @JsonKey(name: 'coverImageUrl') final String? imageUrl,
      final Venue? venue,
      final Organizer? organizer,
      final List<TicketType>? ticketTypes,
      final int? availableTicketsCount,
      final DateTime? createdAt,
      final bool? isPrivate,
      final bool? isFavorite,
      final String? locationDetails}) = _$EventImpl;

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get category;
  @override
  List<String>? get tags;
  @override
  List<String>? get languages;
  @override
  String? get status; // ✅ API envoie startDate / endDate
  @override
  @JsonKey(name: 'startDate')
  DateTime? get eventDate;
  @override
  @JsonKey(name: 'endDate')
  DateTime? get eventEndDate;
  @override
  int? get maxCapacity; // ✅ API envoie coverImageUrl
  @override
  @JsonKey(name: 'coverImageUrl')
  String? get imageUrl; // ✅ venue est un objet
  @override
  Venue? get venue;
  @override
  Organizer? get organizer;
  @override
  List<TicketType>? get ticketTypes;
  @override
  int? get availableTicketsCount;
  @override
  DateTime? get createdAt;
  @override
  bool? get isPrivate;
  @override
  bool? get isFavorite;
  @override
  String? get locationDetails;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventFilterParams _$EventFilterParamsFromJson(Map<String, dynamic> json) {
  return _EventFilterParams.fromJson(json);
}

/// @nodoc
mixin _$EventFilterParams {
  String? get category => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  double? get minPrice => throw _privateConstructorUsedError;
  double? get maxPrice => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;

  /// Serializes this EventFilterParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventFilterParamsCopyWith<EventFilterParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventFilterParamsCopyWith<$Res> {
  factory $EventFilterParamsCopyWith(
          EventFilterParams value, $Res Function(EventFilterParams) then) =
      _$EventFilterParamsCopyWithImpl<$Res, EventFilterParams>;
  @useResult
  $Res call(
      {String? category,
      String? searchQuery,
      DateTime? startDate,
      DateTime? endDate,
      String? location,
      double? minPrice,
      double? maxPrice,
      int? page,
      int? pageSize});
}

/// @nodoc
class _$EventFilterParamsCopyWithImpl<$Res, $Val extends EventFilterParams>
    implements $EventFilterParamsCopyWith<$Res> {
  _$EventFilterParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? searchQuery = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? location = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventFilterParamsImplCopyWith<$Res>
    implements $EventFilterParamsCopyWith<$Res> {
  factory _$$EventFilterParamsImplCopyWith(_$EventFilterParamsImpl value,
          $Res Function(_$EventFilterParamsImpl) then) =
      __$$EventFilterParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? category,
      String? searchQuery,
      DateTime? startDate,
      DateTime? endDate,
      String? location,
      double? minPrice,
      double? maxPrice,
      int? page,
      int? pageSize});
}

/// @nodoc
class __$$EventFilterParamsImplCopyWithImpl<$Res>
    extends _$EventFilterParamsCopyWithImpl<$Res, _$EventFilterParamsImpl>
    implements _$$EventFilterParamsImplCopyWith<$Res> {
  __$$EventFilterParamsImplCopyWithImpl(_$EventFilterParamsImpl _value,
      $Res Function(_$EventFilterParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? searchQuery = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? location = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_$EventFilterParamsImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventFilterParamsImpl implements _EventFilterParams {
  const _$EventFilterParamsImpl(
      {this.category,
      this.searchQuery,
      this.startDate,
      this.endDate,
      this.location,
      this.minPrice,
      this.maxPrice,
      this.page,
      this.pageSize});

  factory _$EventFilterParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventFilterParamsImplFromJson(json);

  @override
  final String? category;
  @override
  final String? searchQuery;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? location;
  @override
  final double? minPrice;
  @override
  final double? maxPrice;
  @override
  final int? page;
  @override
  final int? pageSize;

  @override
  String toString() {
    return 'EventFilterParams(category: $category, searchQuery: $searchQuery, startDate: $startDate, endDate: $endDate, location: $location, minPrice: $minPrice, maxPrice: $maxPrice, page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventFilterParamsImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, searchQuery, startDate,
      endDate, location, minPrice, maxPrice, page, pageSize);

  /// Create a copy of EventFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventFilterParamsImplCopyWith<_$EventFilterParamsImpl> get copyWith =>
      __$$EventFilterParamsImplCopyWithImpl<_$EventFilterParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventFilterParamsImplToJson(
      this,
    );
  }
}

abstract class _EventFilterParams implements EventFilterParams {
  const factory _EventFilterParams(
      {final String? category,
      final String? searchQuery,
      final DateTime? startDate,
      final DateTime? endDate,
      final String? location,
      final double? minPrice,
      final double? maxPrice,
      final int? page,
      final int? pageSize}) = _$EventFilterParamsImpl;

  factory _EventFilterParams.fromJson(Map<String, dynamic> json) =
      _$EventFilterParamsImpl.fromJson;

  @override
  String? get category;
  @override
  String? get searchQuery;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String? get location;
  @override
  double? get minPrice;
  @override
  double? get maxPrice;
  @override
  int? get page;
  @override
  int? get pageSize;

  /// Create a copy of EventFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventFilterParamsImplCopyWith<_$EventFilterParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
