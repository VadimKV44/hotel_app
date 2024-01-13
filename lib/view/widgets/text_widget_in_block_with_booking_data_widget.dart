import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/styles.dart';

class TextWidgetInBlockWithBookingDataWidget extends StatelessWidget {
  const TextWidgetInBlockWithBookingDataWidget({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: MainStyles.kGreyColorW400(16.0),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            data,
            style: MainStyles.kBlackColorW400(16.0),
          ),
        ),
      ],
    );
  }
}