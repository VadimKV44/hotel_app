import 'package:bloc/bloc.dart';
import 'package:hotel_app/model/models/booking_model/booking_model.dart';
import 'package:hotel_app/model/repository/repository.dart';
import 'package:meta/meta.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  Repository repository = Repository();

  void booking() async {
    emit(Loading());
    BookingModel booking = await repository.booking();
    if (booking.error != null) {
      emit(Error(bookingModel: booking));
    } else {
      emit(Success(bookingModel: booking));
    }
  }

  int calculationFullPrice(List<int> prices) {
    return prices.fold<int>(0, (prev, element) => prev + element);
  }
}
