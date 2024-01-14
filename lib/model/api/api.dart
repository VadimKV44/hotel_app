import 'package:dio/dio.dart';
import 'package:hotel_app/model/models/booking_model/booking_model.dart';
import 'package:hotel_app/model/models/hotel_model/hotel_model.dart';
import 'package:hotel_app/model/models/hotels_model/rooms_model.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';
@RestApi(baseUrl: Strings.baseUrl)
abstract class APIClient {
  factory APIClient(Dio dio) = _APIClient;

  @GET("/d144777c-a67f-4e35-867a-cacc3b827473")
  Future<HotelModel> getHotel();

  @GET("/8b532701-709e-4194-a41c-1a903af00195")
  Future<RoomsModel> getRooms();

  @GET("/63866c74-d593-432c-af8e-f279d1a8d2ff")
  Future<BookingModel> booking();
}