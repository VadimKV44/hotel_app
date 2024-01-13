import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';
import 'package:hotel_app/view/widgets/custom_button_widget.dart';
import 'package:hotel_app/view/widgets/image_item_widget.dart';
import 'package:hotel_app/view/widgets/image_view_widget.dart';
import 'package:hotel_app/view/widgets/information_about_room_button_widget.dart';
import 'package:hotel_app/view/widgets/peculiarities_item_widget.dart';

class HotelRoomItemWidget extends StatelessWidget {
  const HotelRoomItemWidget({
    super.key,
    required this.peculiarities,
    required this.images,
    required this.onTap,
  });

  final List<String> images;
  final List<String> peculiarities;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: MainColors.kWhiteColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          ImageViewWidget(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ImageItemWidget(image: 'assets/images/${images[index]}');
            },
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  'Стандартный с видом на бассейн или сад',
                  style: MainStyles.kBlackColorW500(22.0),
                ),
                const SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: peculiarities.map((element) {
                      return PeculiaritiesItemWidget(text: element);
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InformationAboutRoomButtonWidget(onTap: () {}),
                ),
                const SizedBox(height: 16.0),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    Text(
                      '186 600 ₽',
                      style: MainStyles.kBlackColorW600(30.0),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      'за 7 ночей с перелётом',
                      style: MainStyles.kGreyColorW400(16.0),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                CustomButtonWidget(
                  onTap: onTap,
                  text: Strings.chooseRoom,
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
