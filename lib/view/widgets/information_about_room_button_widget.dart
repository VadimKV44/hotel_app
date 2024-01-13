import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';

class InformationAboutRoomButtonWidget extends StatelessWidget {
  const InformationAboutRoomButtonWidget({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: MainColors.kBlueColor.withOpacity(0.1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(5.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Strings.informationAboutRoom,
                  style: MainStyles.kBlueColorW500(16.0),
                ),
                const SizedBox(width: 10.0),
                SvgPicture.asset('assets/icons/left_arrow_blue.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
