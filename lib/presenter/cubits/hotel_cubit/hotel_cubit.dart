import 'package:bloc/bloc.dart';
import 'package:hotel_app/model/models/hotel_model/hotel_model.dart';
import 'package:hotel_app/model/repository/repository.dart';
import 'package:meta/meta.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());

  Repository repository = Repository();

  void getHotel() async {
    emit(Loading());
    HotelModel hotel = await repository.getHotel();
    if (hotel.error != null) {
      emit(Error(hotel: hotel));
    } else {
      emit(Success(hotel: hotel));
    }
  }
}
