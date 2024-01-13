import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';

class PriceBlockWidget extends StatelessWidget {
  const PriceBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: MainColors.kWhiteColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.tour,
                style: MainStyles.kGreyColorW400(16.0),
              ),
              Text(
                '186 600 ₽',
                style: MainStyles.kBlackColorW400(16.0),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.fuelCollection,
                style: MainStyles.kGreyColorW400(16.0),
              ),
              Text(
                '9 300 ₽',
                style: MainStyles.kBlackColorW400(16.0),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.serviceFee,
                style: MainStyles.kGreyColorW400(16.0),
              ),
              Text(
                '2 136 ₽',
                style: MainStyles.kBlackColorW400(16.0),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.toBePaid,
                style: MainStyles.kGreyColorW400(16.0),
              ),
              Text(
                '198 036 ₽',
                style: MainStyles.kBlueColorW600(16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
