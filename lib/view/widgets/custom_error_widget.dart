import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.error,
    required this.refresh,
  });

  final String error;
  final void Function() refresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              error,
              textAlign: TextAlign.center,
              style: MainStyles.kBlackColorW600(30.0),
            ),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: refresh,
            child: const Icon(
              Icons.refresh,
              color: MainColors.kBlackColor,
              size: 40.0,
            ),
          ),
        ],
      ),
    );
  }
}
