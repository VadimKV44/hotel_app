import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/view/consts/colors.dart';

class CustomIconButtonWidget extends StatefulWidget {
  const CustomIconButtonWidget({
    super.key,
    required this.onTap,
    this.arrowIcon = false,
  });

  final void Function() onTap;
  final bool arrowIcon;

  @override
  State<CustomIconButtonWidget> createState() => _CustomIconButtonWidgetState();
}

class _CustomIconButtonWidgetState extends State<CustomIconButtonWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool revealed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MainColors.kBlueColor.withOpacity(widget.arrowIcon ? 0.1 : 1.0),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (revealed) {
              _controller.animateTo(0.0, duration: const Duration(milliseconds: 200));
            } else {
              _controller.animateTo(0.5, duration: const Duration(milliseconds: 200));
            }
            Future.delayed(const Duration(milliseconds: 200), () {
              revealed = !revealed;
            });
            widget.onTap();
          },
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(6.0),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: widget.arrowIcon
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 9.0),
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: SvgPicture.asset('assets/icons/up_blue_arrow.svg'),
                    ),
                  )
                : SvgPicture.asset('assets/icons/add_icon.svg'),
          ),
        ),
      ),
    );
  }
}
