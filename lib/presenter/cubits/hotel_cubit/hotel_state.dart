part of 'hotel_cubit.dart';

@immutable
abstract class HotelState {}

class HotelInitial extends HotelState {}

class Success extends HotelState {
  Success({this.hotel});
  final HotelModel? hotel;
}

class Loading extends HotelState {}

class Error extends HotelState {
  Error({this.hotel});
  final HotelModel? hotel;
}
