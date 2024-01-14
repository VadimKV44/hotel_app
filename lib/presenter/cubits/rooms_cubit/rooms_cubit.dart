import 'package:bloc/bloc.dart';
import 'package:hotel_app/model/models/hotels_model/rooms_model.dart';
import 'package:hotel_app/model/repository/repository.dart';
import 'package:meta/meta.dart';

part 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit() : super(RoomsInitial());

  Repository repository = Repository();

  void getRooms() async {
    emit(Loading());
    RoomsModel rooms = await repository.getRooms();
    if (rooms.error != null) {
      emit(Error(rooms: rooms));
    } else {
      emit(Success(rooms: rooms));
    }
  }
}
