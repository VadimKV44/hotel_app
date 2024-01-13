import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/styles.dart';
import 'package:hotel_app/view/widgets/estimation_widget.dart';

class BlockWithHotelWidget extends StatelessWidget {
  const BlockWithHotelWidget({
    super.key,
    required this.ratingName,
    required this.rating,
    required this.hotelName,
    required this.hotelAddress,
  });

  final int rating;
  final String ratingName;
  final String hotelName;
  final String hotelAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: MainColors.kWhiteColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EstimationWidget(
            rating: rating.toString(),
            ratingName: ratingName,
          ),
          const SizedBox(height: 8.0),
          Text(
            hotelName,
            style: MainStyles.kBlackColorW500(22.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            hotelAddress,
            style: MainStyles.kBlueColorW500(14.0),
          ),
        ],
      ),
    );
  }
}
