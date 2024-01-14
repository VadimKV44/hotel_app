import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/widgets/custom_button_widget.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  final void Function() onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1.0,
          color: MainColors.kLightGreyColor3,
        ),
        Container(
          width: double.infinity,
          color: MainColors.kWhiteColor,
          padding: const EdgeInsets.only(top: 12.0, bottom: 28.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButtonWidget(
              onTap: onTap,
              text: buttonText,
            ),
          ),
        ),
      ],
    );
  }
}
