import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';
import 'package:hotel_app/view/widgets/custom_text_field_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InformationAboutBuyerWidget extends StatelessWidget {
  const InformationAboutBuyerWidget({
    super.key,
    required this.phoneNumberController,
    required this.mailController,
  });

  final TextEditingController phoneNumberController;
  final TextEditingController mailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: MainColors.kWhiteColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Text(
            Strings.informationAboutBuyer,
            style: MainStyles.kBlackColorW500(22.0),
          ),
          const SizedBox(height: 20.0),
          CustomTextFieldWidget(
            controller: phoneNumberController,
            labelText: Strings.phoneNumber,
            inputFormatters: [
              MaskTextInputFormatter(mask: '+7 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')}),
            ],
          ),
          const SizedBox(height: 8.0),
          CustomTextFieldWidget(
            controller: mailController,
            labelText: Strings.mail,
          ),
          const SizedBox(height: 8.0),
          Text(Strings.thisDataNotShared, style: MainStyles.kGreyColorW400(14.0),),
        ],
      ),
    );
  }
}
