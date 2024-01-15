import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';
import 'package:hotel_app/view/widgets/custom_text_field_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InformationAboutBuyerWidget extends StatefulWidget {
  const InformationAboutBuyerWidget({
    super.key,
    required this.phoneNumberController,
    required this.mailController,
  });

  final TextEditingController phoneNumberController;
  final TextEditingController mailController;

  @override
  State<InformationAboutBuyerWidget> createState() => _InformationAboutBuyerWidgetState();
}

class _InformationAboutBuyerWidgetState extends State<InformationAboutBuyerWidget> {

  bool _phoneNumberFieldValidate = true;
  bool _mailFieldValidate = true;

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
            hintText: '+7 (***) ***-**-**',
            controller: widget.phoneNumberController,
            labelText: Strings.phoneNumber,
            inputFormatters: [
              MaskTextInputFormatter(mask: '+7 (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')}),
            ],
            fillColor: _phoneNumberFieldValidate ? MainColors.kLightGreyColor : MainColors.kRedColor.withOpacity(0.15),
            validator: (String? text) {
              setState(() {
                _phoneNumberFieldValidate = !(text == null || text.isEmpty);
              });
              return text == null || text.isEmpty ? '' : null;
            },
          ),
          const SizedBox(height: 8.0),
          CustomTextFieldWidget(
            controller: widget.mailController,
            labelText: Strings.mail,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 @ .]")),
            ],
            fillColor: _mailFieldValidate ? MainColors.kLightGreyColor : MainColors.kRedColor.withOpacity(0.15),
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                _mailFieldValidate = false;
              } else {
                _mailFieldValidate = text.contains('@mail.ru') || text.contains('@gmail.com') || text.contains('@yandex.ru');
              }
              return text == null || text.isEmpty ? '' : null;
            },
          ),
          const SizedBox(height: 8.0),
          Text(Strings.thisDataNotShared, style: MainStyles.kGreyColorW400(14.0),),
        ],
      ),
    );
  }
}
