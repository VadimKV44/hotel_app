// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomsModel _$RoomsModelFromJson(Map<String, dynamic> json) => RoomsModel(
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$RoomsModelToJson(RoomsModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'rooms': instance.rooms,
    };
