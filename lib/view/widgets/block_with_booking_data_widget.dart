import 'package:flutter/material.dart';
import 'package:hotel_app/model/models/booking_model/booking_model.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/widgets/text_widget_in_block_with_booking_data_widget.dart';

class BlockWithBookingDataWidget extends StatelessWidget {
  const BlockWithBookingDataWidget({
    super.key,
    required this.bookingModel,
  });

  final BookingModel? bookingModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: MainColors.kWhiteColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          TextWidgetInBlockWithBookingDataWidget(
            title: Strings.departureFrom,
            data: bookingModel?.departure ?? '',
          ),
          const SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(
            title: Strings.countryCity,
            data: bookingModel?.arrivalCountry ?? '',
          ),
          const SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(
            title: Strings.dates,
            data: '${bookingModel?.tourDateStart ?? ''} – ${bookingModel?.tourDateStop ?? ''}',
          ),
          const SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(
            title: Strings.numberOfNights,
            data: bookingModel?.numberOfNights != null ? '${bookingModel?.numberOfNights} ночей' : '',
          ),
          const SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(
            title: Strings.hotel,
            data: bookingModel?.hotelName ?? '',
          ),
          const SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(
            title: Strings.room,
            data: bookingModel?.room ?? '',
          ),
          const SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(
            title: Strings.food,
            data: bookingModel?.nutrition ?? '',
          ),
        ],
      ),
    );
  }
}
