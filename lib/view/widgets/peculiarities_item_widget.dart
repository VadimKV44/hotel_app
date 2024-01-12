import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/styles.dart';

class PeculiaritiesItemWidget extends StatelessWidget {
  const PeculiaritiesItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      decoration: BoxDecoration(
        color: MainColors.kLightGreyColor2,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: MainStyles.kGreyColorW500(16.0),
      ),
    );
  }
}
