import 'package:hotel_app/model/models/room_model/room_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rooms_model.g.dart';

@JsonSerializable()
class RoomsModel {
  RoomsModel({
    this.rooms,
    this.error,
});

  factory RoomsModel.fromJson(Map<String, dynamic> json) => _$RoomsModelFromJson(json);

  final String? error;
  final List<RoomModel>? rooms;
}