import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/widgets/text_widget_in_block_with_booking_data_widget.dart';

class BlockWithBookingDataWidget extends StatelessWidget {
  const BlockWithBookingDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: MainColors.kWhiteColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const Column(
        children: [
          TextWidgetInBlockWithBookingDataWidget(title: Strings.departureFrom, data: 'Санкт-Петербург'),
          SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(title: Strings.countryCity, data: 'Египет, Хургада'),
          SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(title: Strings.dates, data: '19.09.2023 – 27.09.2023'),
          SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(title: Strings.numberOfNights, data: '7 ночей'),
          SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(title: Strings.hotel, data: 'Steigenberger Makadi'),
          SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(title: Strings.room, data: 'Стандартный с видом на бассейн или сад'),
          SizedBox(height: 16.0),
          TextWidgetInBlockWithBookingDataWidget(title: Strings.food, data: 'Все включено'),
        ],
      ),
    );
  }
}
