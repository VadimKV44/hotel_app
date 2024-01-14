import 'package:dio/dio.dart';
import 'package:hotel_app/model/models/booking_model/booking_model.dart';
import 'package:hotel_app/model/models/hotel_model/hotel_model.dart';
import 'package:hotel_app/model/models/hotels_model/rooms_model.dart';
import 'package:hotel_app/model/api/api.dart';
import 'package:hotel_app/view/consts/strings.dart';

class Repository {
  APIClient mClient = APIClient(Dio());

  Future<HotelModel> getHotel() async {
    HotelModel? result;
    try {
      result = await mClient.getHotel();
    } catch (e) {
      result = const HotelModel(error: Strings.error);
    }
    return result;
  }

  Future<RoomsModel> getRooms() async {
    RoomsModel? result;
    try {
      result = await mClient.getRooms();
    } catch (e) {
      result = RoomsModel(error: Strings.error);
    }
    return result;
  }

  Future<BookingModel> booking() async {
    BookingModel? result;
    try {
      result = await mClient.booking();
    } catch (e) {
      result = BookingModel(error: Strings.error);
    }
    return result;
  }
}
