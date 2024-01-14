import 'package:json_annotation/json_annotation.dart';

part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {
  RoomModel({
    this.id,
    this.name,
    this.price,
    this.pricePer,
    this.peculiarities,
    this.imageUrls,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);

  final int? id;
  final String? name;
  final int? price;
  @JsonKey(name: 'price_per')
  final String? pricePer;
  final List<String>? peculiarities;
  @JsonKey(name: 'image_urls')
  final List<String>? imageUrls;
}
