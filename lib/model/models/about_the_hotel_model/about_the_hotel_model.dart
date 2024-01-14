import 'package:json_annotation/json_annotation.dart';

part 'about_the_hotel_model.g.dart';

@JsonSerializable()
class AboutTheHotelModel {
  const AboutTheHotelModel({
    required this.description,
    required this.peculiarities,
  });

  factory AboutTheHotelModel.fromJson(Map<String, dynamic> json) => _$AboutTheHotelModelFromJson(json);

  final String description;
  final List<String>? peculiarities;
}
