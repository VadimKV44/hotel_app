import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/styles.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
  });

  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MainColors.kBlueColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15.0),
          splashColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: MainStyles.kWhiteColorW500(16.0),
            ),
          ),
        ),
      ),
    );
  }
}
