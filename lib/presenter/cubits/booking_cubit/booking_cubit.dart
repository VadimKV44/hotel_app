import 'package:bloc/bloc.dart';
import 'package:hotel_app/model/models/booking_model/booking_model.dart';
import 'package:hotel_app/model/repository/repository.dart';
import 'package:meta/meta.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  Repository repository = Repository();

  BookingModel bookingModel = BookingModel();

  void booking() async {
    emit(Loading());
    bookingModel = await repository.booking();
    if (bookingModel.error != null) {
      emit(Error());
    } else {
      emit(Success());
    }
  }

  int calculationFullPrice(List<int> prices) {
    return prices.fold<int>(0, (prev, element) => prev + element);
  }

  List<int> touristItems = [0];

  void addTourist(int index) {
    touristItems.add(index);
    emit(Success());
  }
}
