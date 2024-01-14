// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_the_hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutTheHotelModel _$AboutTheHotelModelFromJson(Map<String, dynamic> json) =>
    AboutTheHotelModel(
      description: json['description'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AboutTheHotelModelToJson(AboutTheHotelModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };
