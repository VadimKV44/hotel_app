import 'package:flutter/material.dart';
import 'package:hotel_app/model/models/hotel_functions_model.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';
import 'package:hotel_app/view/widgets/about_hotel_widget.dart';
import 'package:hotel_app/view/widgets/custom_button_widget.dart';
import 'package:hotel_app/view/widgets/estimation_widget.dart';
import 'package:hotel_app/view/widgets/image_item_widget.dart';
import 'package:hotel_app/view/widgets/image_view_widget.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  List<String> images = [
    'assets/images/image_1.png',
    'assets/images/image_1.png',
    'assets/images/image_1.png',
    'assets/images/image_1.png',
  ];

  List<String> peculiarities = ['3-я линия', 'Платный Wi-Fi в фойе', '30 км до аэропорта', '1 км до пляжа'];

  List<HotelFunction> hotelFunctions = [
    HotelFunction(title: 'Удобства', description: 'Самое необходимое', icon: 'emoji_happy.svg'),
    HotelFunction(title: 'Что включено', description: 'Самое необходимое', icon: 'tick_square.svg'),
    HotelFunction(title: 'Что не включено', description: 'Самое необходимое', icon: 'close_square.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.kLightGreyColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: MainColors.kWhiteColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).viewPadding.top + 19.0),
                        Text(
                          Strings.hotel,
                          style: MainStyles.kBlackColorW500(18.0),
                        ),
                        const SizedBox(height: 16.0),
                        ImageViewWidget(
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return const ImageItemWidget(image: 'assets/images/image_1.png');
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              EstimationWidget(
                                rating: 5.toString(),
                                ratingName: 'Превосходно',
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Steigenberger Makadi',
                                style: MainStyles.kBlackColorW500(22.0),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
                                style: MainStyles.kBlueColorW500(14.0),
                              ),
                              const SizedBox(height: 16.0),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: [
                                  Text(
                                    'от 134 673 ₽',
                                    style: MainStyles.kBlackColorW600(30.0),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    'за тур с перелётом',
                                    style: MainStyles.kGreyColorW400(16.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  AboutHotelWidget(
                    hotelFunctions: hotelFunctions,
                    peculiarities: peculiarities,
                  ),
                ],
              ),
            ),
          ),
          Column(
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
                    onTap: () {},
                    text: Strings.toChooseRoom,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
