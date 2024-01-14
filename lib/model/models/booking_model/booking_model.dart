import 'package:json_annotation/json_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel {
  BookingModel({
    this.error,
    this.id,
    this.hotelName,
    this.hotelAddress,
    this.horating,
    this.ratingName,
    this.departure,
    this.arrivalCountry,
    this.tourDateStart,
    this.tourDateStop,
    this.numberOfNights,
    this.room,
    this.nutrition,
    this.tourPrice,
    this.fuelCharge,
    this.serviceCharge,
});

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

  final String? error;

  final int? id;

@JsonKey(name: 'hotel_name')
final String? hotelName;

@JsonKey(name: 'hotel_adress')
final String? hotelAddress;

final int? horating;

@JsonKey(name: 'rating_name')
final String? ratingName;

final String? departure;

@JsonKey(name: 'arrival_country')
final String? arrivalCountry;

@JsonKey(name: 'tour_date_start')
final String? tourDateStart;

@JsonKey(name: 'tour_date_stop')
final String? tourDateStop;

@JsonKey(name: 'number_of_nights')
final int? numberOfNights;

final String? room;

final String? nutrition;

@JsonKey(name: 'tour_price')
final int? tourPrice;

@JsonKey(name: 'fuel_charge')
final int? fuelCharge;

@JsonKey(name: 'service_charge')
final int? serviceCharge;
}