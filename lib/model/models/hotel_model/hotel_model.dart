import 'package:hotel_app/model/models/about_the_hotel_model/about_the_hotel_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_model.g.dart';

@JsonSerializable()
class HotelModel {
  const HotelModel({
    this.id,
    this.name,
    this.address,
    this.minimalPrice,
    this.priceForIt,
    this.rating,
    this.ratingName,
    this.imageUrls,
    this.aboutTheHotelModel,
    this.error,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) => _$HotelModelFromJson(json);

  final String? error;
  final int? id;
  final String? name;
  @JsonKey(name: 'adress')
  final String? address;
  @JsonKey(name: 'minimal_price')
  final int? minimalPrice;
  @JsonKey(name: 'price_for_it')
  final String? priceForIt;
  final int? rating;
  @JsonKey(name: 'rating_name')
  final String? ratingName;
  @JsonKey(name: 'image_urls')
  final List<String>? imageUrls;
  @JsonKey(name: 'about_the_hotel')
  final AboutTheHotelModel? aboutTheHotelModel;
}
