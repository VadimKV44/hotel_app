import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/screens/booking_hotel_room_screen.dart';
import 'package:hotel_app/view/widgets/custom_appbar_widget.dart';
import 'package:hotel_app/view/widgets/hotel_room_item_widget.dart';

class HotelRoomScreen extends StatefulWidget {
  const HotelRoomScreen({super.key});

  @override
  State<HotelRoomScreen> createState() => _HotelRoomScreenState();
}

class _HotelRoomScreenState extends State<HotelRoomScreen> {
  List<String> images = [
    'image_2.png',
    'image_2.png',
    'image_2.png',
    'image_2.png',
  ];

  List<String> peculiarities = ['Все включено', 'Кондиционер'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.kLightGreyColor,
      appBar: const CustomAppBarWidget(title: 'Steigenberger Makadi'),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 4.0, bottom: 40.0),
        itemCount: 2,
        itemBuilder: (context, index) {
          return HotelRoomItemWidget(
            peculiarities: peculiarities,
            images: images,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingHotelRoomScreen()));
            },
          );
        },
      ),
    );
  }
}
