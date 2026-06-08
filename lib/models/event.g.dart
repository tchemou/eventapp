// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VenueImpl _$$VenueImplFromJson(Map<String, dynamic> json) => _$VenueImpl(
      id: json['id'] as String,
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      googleMapsUrl: json['googleMapsUrl'] as String?,
      onlineUrl: json['onlineUrl'] as String?,
      isOnline: json['isOnline'] as bool?,
    );

Map<String, dynamic> _$$VenueImplToJson(_$VenueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'googleMapsUrl': instance.googleMapsUrl,
      'onlineUrl': instance.onlineUrl,
      'isOnline': instance.isOnline,
    };

_$OrganizerImpl _$$OrganizerImplFromJson(Map<String, dynamic> json) =>
    _$OrganizerImpl(
      logo: json['logo'] as String?,
      description: json['description'] as String?,
      socialNetworks: (json['socialNetworks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$$OrganizerImplToJson(_$OrganizerImpl instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'description': instance.description,
      'socialNetworks': instance.socialNetworks,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'city': instance.city,
    };

_$TicketTypeImpl _$$TicketTypeImplFromJson(Map<String, dynamic> json) =>
    _$TicketTypeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      availableQuantity: (json['availableQuantity'] as num?)?.toInt(),
      soldQuantity: (json['soldQuantity'] as num?)?.toInt(),
      saleStartDate: json['saleStartDate'] as String?,
      saleEndDate: json['saleEndDate'] as String?,
      limitPerPerson: (json['limitPerPerson'] as num?)?.toInt(),
      isVisible: json['isVisible'] as bool?,
      isFree: json['isFree'] as bool?,
      eventId: json['eventId'] as String?,
    );

Map<String, dynamic> _$$TicketTypeImplToJson(_$TicketTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'availableQuantity': instance.availableQuantity,
      'soldQuantity': instance.soldQuantity,
      'saleStartDate': instance.saleStartDate,
      'saleEndDate': instance.saleEndDate,
      'limitPerPerson': instance.limitPerPerson,
      'isVisible': instance.isVisible,
      'isFree': instance.isFree,
      'eventId': instance.eventId,
    };

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      category: json['category'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      eventDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      eventEndDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      maxCapacity: (json['maxCapacity'] as num?)?.toInt(),
      imageUrl: json['coverImageUrl'] as String?,
      venue: json['venue'] == null
          ? null
          : Venue.fromJson(json['venue'] as Map<String, dynamic>),
      organizer: json['organizer'] == null
          ? null
          : Organizer.fromJson(json['organizer'] as Map<String, dynamic>),
      ticketTypes: (json['ticketTypes'] as List<dynamic>?)
          ?.map((e) => TicketType.fromJson(e as Map<String, dynamic>))
          .toList(),
      availableTicketsCount: (json['availableTicketsCount'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isPrivate: json['isPrivate'] as bool?,
      isFavorite: json['isFavorite'] as bool?,
      locationDetails: json['locationDetails'] as String?,
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'tags': instance.tags,
      'languages': instance.languages,
      'status': instance.status,
      'startDate': instance.eventDate?.toIso8601String(),
      'endDate': instance.eventEndDate?.toIso8601String(),
      'maxCapacity': instance.maxCapacity,
      'coverImageUrl': instance.imageUrl,
      'venue': instance.venue,
      'organizer': instance.organizer,
      'ticketTypes': instance.ticketTypes,
      'availableTicketsCount': instance.availableTicketsCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isPrivate': instance.isPrivate,
      'isFavorite': instance.isFavorite,
      'locationDetails': instance.locationDetails,
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
