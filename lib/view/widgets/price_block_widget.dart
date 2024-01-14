import 'package:flutter/material.dart';
import 'package:hotel_app/presenter/utils/money_formatter.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';

class PriceBlockWidget extends StatelessWidget {
  const PriceBlockWidget({
    super.key,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
    required this.fullPrice,
  });

  final String tourPrice;
  final String fuelCharge;
  final String serviceCharge;
  final String fullPrice;

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
                '${moneyFormatter(double.parse(tourPrice))} ₽',
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
                '${moneyFormatter(double.parse(fuelCharge))} ₽',
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
                '${moneyFormatter(double.parse(serviceCharge))} ₽',
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
                '${moneyFormatter(double.parse(fullPrice))} ₽',
                style: MainStyles.kBlueColorW600(16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
