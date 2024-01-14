import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';
import 'package:hotel_app/view/widgets/bottom_bar_widget.dart';
import 'package:hotel_app/view/widgets/custom_appbar_widget.dart';

class PaidScreen extends StatelessWidget {
  const PaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.kWhiteColor,
      appBar: const CustomAppBarWidget(title: Strings.orderHasBeenPaid),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 2.7),
                        padding: const EdgeInsets.all(25.0),
                        decoration: const BoxDecoration(
                          color: MainColors.kLightGreyColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/party_popper.png'),
                      ),
                      const SizedBox(height: 32.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23.0),
                        child: Text(
                          Strings.yourOrderHasBeenAccepted,
                          style: MainStyles.kBlackColorW500(22.0),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23.0),
                        child: Text(
                          '${Strings.orderHasBeenPaidDescription1}123123${Strings.orderHasBeenPaidDescription2}',
                          textAlign: TextAlign.center,
                          style: MainStyles.kGreyColorW400(16.0),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomBarWidget(
                  onTap: () {},
                  buttonText: Strings.sup,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
