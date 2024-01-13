import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(12.0),
        child: SvgPicture.asset(
          'assets/icons/left_arrow.svg',
          height: 32.0,
          width: 32.0,
        ),
      ),
    );
  }
}
