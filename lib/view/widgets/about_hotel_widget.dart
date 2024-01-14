import 'package:flutter/material.dart';
import 'package:hotel_app/model/models/hotel_functions_model.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';
import 'package:hotel_app/view/widgets/hotel_functions_widget.dart';
import 'package:hotel_app/view/widgets/peculiarities_item_widget.dart';

class AboutHotelWidget extends StatelessWidget {
  const AboutHotelWidget({
    super.key,
    required this.hotelFunctions,
    required this.peculiarities,
    required this.description,
  });

  final List<HotelFunction> hotelFunctions;
  final List<String> peculiarities;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MainColors.kWhiteColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Strings.aboutHotel,
                style: MainStyles.kBlackColorW500(22.0),
              ),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: peculiarities.map((element) {
                  return PeculiaritiesItemWidget(text: element);
                }).toList(),
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              description,
              style: MainStyles.kBlackColorW400(16.0, 0.9),
            ),
            const SizedBox(height: 16.0),
            HotelFunctionsWidget(hotelFunctions: hotelFunctions),
          ],
        ),
      ),
    );
  }
}
