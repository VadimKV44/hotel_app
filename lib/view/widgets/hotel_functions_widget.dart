import 'package:flutter/material.dart';
import 'package:hotel_app/model/models/hotel_functions_model.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/widgets/hotel_function_widget.dart';

class HotelFunctionsWidget extends StatelessWidget {
  const HotelFunctionsWidget({
    super.key,
    required this.hotelFunctions,
  });

  final List<HotelFunction> hotelFunctions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MainColors.kLightGreyColor2,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: hotelFunctions.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return HotelFunctionWidget(
            index: index,
            hotelFunctionsLength: hotelFunctions.length,
            hotelFunction: hotelFunctions[index],
          );
        },
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 36.0, right: 15.0),
            child: Divider(
              thickness: 1,
              color: MainColors.kGreyColor3.withOpacity(0.15),
            ),
          );
        },
      ),
    );
  }
}
