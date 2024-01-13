import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/styles.dart';
import 'package:hotel_app/view/widgets/icon_button_widget.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key, required this.title,});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: MainColors.kWhiteColor,
      title: Text(
        title,
        style: MainStyles.kBlackColorW500(18.0),
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IconButtonWidget(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}