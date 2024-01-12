import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/styles.dart';

class EstimationWidget extends StatelessWidget {
  const EstimationWidget({
    super.key,
    required this.rating,
    required this.ratingName,
  });

  final String rating;
  final String ratingName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: MainColors.kYellowColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/icons/star.svg'),
          const SizedBox(width: 2.0),
          Text(
            '$rating $ratingName',
            style: MainStyles.kOrangeColorW500(16.0),
          ),
        ],
      ),
    );
  }
}
