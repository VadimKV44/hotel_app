// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelModel _$HotelModelFromJson(Map<String, dynamic> json) => HotelModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['adress'] as String?,
      minimalPrice: json['minimal_price'] as int?,
      priceForIt: json['price_for_it'] as String?,
      rating: json['rating'] as int?,
      ratingName: json['rating_name'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      aboutTheHotelModel: json['about_the_hotel'] == null
          ? null
          : AboutTheHotelModel.fromJson(
              json['about_the_hotel'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$HotelModelToJson(HotelModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'id': instance.id,
      'name': instance.name,
      'adress': instance.address,
      'minimal_price': instance.minimalPrice,
      'price_for_it': instance.priceForIt,
      'rating': instance.rating,
      'rating_name': instance.ratingName,
      'image_urls': instance.imageUrls,
      'about_the_hotel': instance.aboutTheHotelModel,
    };
