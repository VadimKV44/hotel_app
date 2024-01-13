import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/screens/paid_screen.dart';
import 'package:hotel_app/view/widgets/add_tourist_widget.dart';
import 'package:hotel_app/view/widgets/block_with_booking_data_widget.dart';
import 'package:hotel_app/view/widgets/block_with_hotel_widget.dart';
import 'package:hotel_app/view/widgets/custom_appbar_widget.dart';
import 'package:hotel_app/view/widgets/custom_button_widget.dart';
import 'package:hotel_app/view/widgets/information_about_buyer_widget.dart';
import 'package:hotel_app/view/widgets/price_block_widget.dart';
import 'package:hotel_app/view/widgets/tourist_item_widget.dart';

class BookingHotelRoomScreen extends StatefulWidget {
  const BookingHotelRoomScreen({super.key});

  @override
  State<BookingHotelRoomScreen> createState() => _BookingHotelRoomScreenState();
}

class _BookingHotelRoomScreenState extends State<BookingHotelRoomScreen> {
  final GlobalKey<AnimatedListState> _touristsKey = GlobalKey<AnimatedListState>(debugLabel: 'tourists_key');
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _mailController.dispose();
    super.dispose();
  }

  int initialItemCount = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: MainColors.kLightGreyColor,
        appBar: const CustomAppBarWidget(title: Strings.booking),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 8.0),
                    const BlockWithHotelWidget(
                      ratingName: 'Превосходно',
                      rating: 5,
                      hotelName: 'Steigenberger Makadi',
                      hotelAddress: 'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
                    ),
                    const SizedBox(height: 8.0),
                    const BlockWithBookingDataWidget(),
                    const SizedBox(height: 8.0),
                    InformationAboutBuyerWidget(
                      phoneNumberController: _phoneNumberController,
                      mailController: _mailController,
                    ),
                    const SizedBox(height: 4.0),
                    AnimatedList(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      key: _touristsKey,
                      physics: const NeverScrollableScrollPhysics(),
                      initialItemCount: initialItemCount,
                      itemBuilder: (context, index, animation) {
                        return SizeTransition(
                          sizeFactor: animation,
                          child: const TouristItemWidget(),
                        );
                      },
                    ),
                    const SizedBox(height: 4.0),
                    AddTouristWidget(
                      onTap: () {
                        setState(() {
                          _touristsKey.currentState?.insertItem(initialItemCount);
                          initialItemCount + 1;
                        });
                      },
                    ),
                    const SizedBox(height: 8.0),
                    PriceBlockWidget(),
                    const SizedBox(height: 10.0),
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
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PaidScreen()));
                      },
                      text: '${Strings.toPay} 198 036 ₽',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
