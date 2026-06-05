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

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  DateTime get eventDate => throw _privateConstructorUsedError;
  DateTime get eventEndDate => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String? get locationDetails => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get organizer => throw _privateConstructorUsedError;
  String? get organizerId => throw _privateConstructorUsedError;
  int? get attendeeCount => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;
  bool? get isFavorite => throw _privateConstructorUsedError;
  List<TicketType>? get ticketTypes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

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
      String description,
      String? imageUrl,
      DateTime eventDate,
      DateTime eventEndDate,
      String location,
      String? locationDetails,
      String category,
      String organizer,
      String? organizerId,
      int? attendeeCount,
      double? latitude,
      double? longitude,
      bool isPublished,
      bool? isFavorite,
      List<TicketType>? ticketTypes,
      DateTime? createdAt,
      DateTime? updatedAt});
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
    Object? description = null,
    Object? imageUrl = freezed,
    Object? eventDate = null,
    Object? eventEndDate = null,
    Object? location = null,
    Object? locationDetails = freezed,
    Object? category = null,
    Object? organizer = null,
    Object? organizerId = freezed,
    Object? attendeeCount = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isPublished = null,
    Object? isFavorite = freezed,
    Object? ticketTypes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventEndDate: null == eventEndDate
          ? _value.eventEndDate
          : eventEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      organizer: null == organizer
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: freezed == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String?,
      attendeeCount: freezed == attendeeCount
          ? _value.attendeeCount
          : attendeeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      ticketTypes: freezed == ticketTypes
          ? _value.ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<TicketType>?,
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
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String? imageUrl,
      DateTime eventDate,
      DateTime eventEndDate,
      String location,
      String? locationDetails,
      String category,
      String organizer,
      String? organizerId,
      int? attendeeCount,
      double? latitude,
      double? longitude,
      bool isPublished,
      bool? isFavorite,
      List<TicketType>? ticketTypes,
      DateTime? createdAt,
      DateTime? updatedAt});
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
    Object? description = null,
    Object? imageUrl = freezed,
    Object? eventDate = null,
    Object? eventEndDate = null,
    Object? location = null,
    Object? locationDetails = freezed,
    Object? category = null,
    Object? organizer = null,
    Object? organizerId = freezed,
    Object? attendeeCount = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isPublished = null,
    Object? isFavorite = freezed,
    Object? ticketTypes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventEndDate: null == eventEndDate
          ? _value.eventEndDate
          : eventEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      organizer: null == organizer
          ? _value.organizer
          : organizer // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: freezed == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String?,
      attendeeCount: freezed == attendeeCount
          ? _value.attendeeCount
          : attendeeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      ticketTypes: freezed == ticketTypes
          ? _value._ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<TicketType>?,
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
class _$EventImpl implements _Event {
  const _$EventImpl(
      {required this.id,
      required this.title,
      required this.description,
      this.imageUrl,
      required this.eventDate,
      required this.eventEndDate,
      required this.location,
      this.locationDetails,
      required this.category,
      required this.organizer,
      this.organizerId,
      this.attendeeCount,
      this.latitude,
      this.longitude,
      required this.isPublished,
      this.isFavorite,
      required final List<TicketType>? ticketTypes,
      this.createdAt,
      this.updatedAt})
      : _ticketTypes = ticketTypes;

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String? imageUrl;
  @override
  final DateTime eventDate;
  @override
  final DateTime eventEndDate;
  @override
  final String location;
  @override
  final String? locationDetails;
  @override
  final String category;
  @override
  final String organizer;
  @override
  final String? organizerId;
  @override
  final int? attendeeCount;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final bool isPublished;
  @override
  final bool? isFavorite;
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
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Event(id: $id, title: $title, description: $description, imageUrl: $imageUrl, eventDate: $eventDate, eventEndDate: $eventEndDate, location: $location, locationDetails: $locationDetails, category: $category, organizer: $organizer, organizerId: $organizerId, attendeeCount: $attendeeCount, latitude: $latitude, longitude: $longitude, isPublished: $isPublished, isFavorite: $isFavorite, ticketTypes: $ticketTypes, createdAt: $createdAt, updatedAt: $updatedAt)';
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
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.eventEndDate, eventEndDate) ||
                other.eventEndDate == eventEndDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.locationDetails, locationDetails) ||
                other.locationDetails == locationDetails) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.organizer, organizer) ||
                other.organizer == organizer) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.attendeeCount, attendeeCount) ||
                other.attendeeCount == attendeeCount) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            const DeepCollectionEquality()
                .equals(other._ticketTypes, _ticketTypes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        imageUrl,
        eventDate,
        eventEndDate,
        location,
        locationDetails,
        category,
        organizer,
        organizerId,
        attendeeCount,
        latitude,
        longitude,
        isPublished,
        isFavorite,
        const DeepCollectionEquality().hash(_ticketTypes),
        createdAt,
        updatedAt
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
      required final String description,
      final String? imageUrl,
      required final DateTime eventDate,
      required final DateTime eventEndDate,
      required final String location,
      final String? locationDetails,
      required final String category,
      required final String organizer,
      final String? organizerId,
      final int? attendeeCount,
      final double? latitude,
      final double? longitude,
      required final bool isPublished,
      final bool? isFavorite,
      required final List<TicketType>? ticketTypes,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$EventImpl;

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String? get imageUrl;
  @override
  DateTime get eventDate;
  @override
  DateTime get eventEndDate;
  @override
  String get location;
  @override
  String? get locationDetails;
  @override
  String get category;
  @override
  String get organizer;
  @override
  String? get organizerId;
  @override
  int? get attendeeCount;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  bool get isPublished;
  @override
  bool? get isFavorite;
  @override
  List<TicketType>? get ticketTypes;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TicketType _$TicketTypeFromJson(Map<String, dynamic> json) {
  return _TicketType.fromJson(json);
}

/// @nodoc
mixin _$TicketType {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get availableQuantity => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

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
      String description,
      double price,
      int quantity,
      int availableQuantity,
      String eventId,
      DateTime? createdAt});
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
    Object? description = null,
    Object? price = null,
    Object? quantity = null,
    Object? availableQuantity = null,
    Object? eventId = null,
    Object? createdAt = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      String description,
      double price,
      int quantity,
      int availableQuantity,
      String eventId,
      DateTime? createdAt});
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
    Object? description = null,
    Object? price = null,
    Object? quantity = null,
    Object? availableQuantity = null,
    Object? eventId = null,
    Object? createdAt = freezed,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketTypeImpl implements _TicketType {
  const _$TicketTypeImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.availableQuantity,
      required this.eventId,
      this.createdAt});

  factory _$TicketTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketTypeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final int availableQuantity;
  @override
  final String eventId;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'TicketType(id: $id, name: $name, description: $description, price: $price, quantity: $quantity, availableQuantity: $availableQuantity, eventId: $eventId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.availableQuantity, availableQuantity) ||
                other.availableQuantity == availableQuantity) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, price,
      quantity, availableQuantity, eventId, createdAt);

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
      required final String description,
      required final double price,
      required final int quantity,
      required final int availableQuantity,
      required final String eventId,
      final DateTime? createdAt}) = _$TicketTypeImpl;

  factory _TicketType.fromJson(Map<String, dynamic> json) =
      _$TicketTypeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  int get quantity;
  @override
  int get availableQuantity;
  @override
  String get eventId;
  @override
  DateTime? get createdAt;

  /// Create a copy of TicketType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketTypeImplCopyWith<_$TicketTypeImpl> get copyWith =>
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
