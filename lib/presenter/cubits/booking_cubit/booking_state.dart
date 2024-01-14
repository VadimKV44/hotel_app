part of 'booking_cubit.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class Success extends BookingState {
  Success({this.bookingModel});
  final BookingModel? bookingModel;
}

class Loading extends BookingState {}

class Error extends BookingState {
  Error({this.bookingModel});
  final BookingModel? bookingModel;
}
