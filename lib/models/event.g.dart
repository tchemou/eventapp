// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
      eventDate: DateTime.parse(json['eventDate'] as String),
      eventEndDate: DateTime.parse(json['eventEndDate'] as String),
      location: json['location'] as String,
      locationDetails: json['locationDetails'] as String?,
      category: json['category'] as String,
      organizer: json['organizer'] as String,
      organizerId: json['organizerId'] as String?,
      attendeeCount: (json['attendeeCount'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isPublished: json['isPublished'] as bool,
      isFavorite: json['isFavorite'] as bool?,
      ticketTypes: (json['ticketTypes'] as List<dynamic>?)
          ?.map((e) => TicketType.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'eventDate': instance.eventDate.toIso8601String(),
      'eventEndDate': instance.eventEndDate.toIso8601String(),
      'location': instance.location,
      'locationDetails': instance.locationDetails,
      'category': instance.category,
      'organizer': instance.organizer,
      'organizerId': instance.organizerId,
      'attendeeCount': instance.attendeeCount,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'isPublished': instance.isPublished,
      'isFavorite': instance.isFavorite,
      'ticketTypes': instance.ticketTypes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$TicketTypeImpl _$$TicketTypeImplFromJson(Map<String, dynamic> json) =>
    _$TicketTypeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      availableQuantity: (json['availableQuantity'] as num).toInt(),
      eventId: json['eventId'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TicketTypeImplToJson(_$TicketTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'availableQuantity': instance.availableQuantity,
      'eventId': instance.eventId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$EventFilterParamsImpl _$$EventFilterParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$EventFilterParamsImpl(
      category: json['category'] as String?,
      searchQuery: json['searchQuery'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      location: json['location'] as String?,
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      maxPrice: (json['maxPrice'] as num?)?.toDouble(),
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EventFilterParamsImplToJson(
        _$EventFilterParamsImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'searchQuery': instance.searchQuery,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'location': instance.location,
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'page': instance.page,
      'pageSize': instance.pageSize,
    };
