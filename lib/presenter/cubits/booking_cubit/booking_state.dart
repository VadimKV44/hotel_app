part of 'booking_cubit.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class Success extends BookingState {}

class Loading extends BookingState {}

class Error extends BookingState {}
