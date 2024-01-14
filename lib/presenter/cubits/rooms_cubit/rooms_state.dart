part of 'rooms_cubit.dart';

@immutable
abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class Success extends RoomsState {
  Success({this.rooms});
  final RoomsModel? rooms;
}

class Loading extends RoomsState {}

class Error extends RoomsState {
  Error({this.rooms});
  final RoomsModel? rooms;
}
