import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingAnimationWidget extends StatelessWidget {
  const CustomLoadingAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        size: 150, color: MainColors.kBlackColor,
      ),
    );
  }
}
