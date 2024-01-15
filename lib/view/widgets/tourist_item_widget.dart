import 'package:flutter/material.dart';
import 'package:hotel_app/presenter/utils/number_to_word.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';
import 'package:hotel_app/view/widgets/animation_expandable_section_widget.dart';
import 'package:hotel_app/view/widgets/custom_icon_button_widget.dart';
import 'package:hotel_app/view/widgets/custom_text_field_widget.dart';

class TouristItemWidget extends StatefulWidget {
  const TouristItemWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<TouristItemWidget> createState() => _TouristItemWidgetState();
}

class _TouristItemWidgetState extends State<TouristItemWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _citizenshipController = TextEditingController();
  final TextEditingController _passportNumberController = TextEditingController();
  final TextEditingController _validityPeriodOfPassportController = TextEditingController();

  bool nameFieldValidate = true;
  bool surnameFieldValidate = true;
  bool birthDateFieldValidate = true;
  bool citizenshipFieldValidate = true;
  bool passportNumberFieldValidate = true;
  bool validityPeriodOfPassportFieldValidate = true;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _birthDateController.dispose();
    _citizenshipController.dispose();
    _passportNumberController.dispose();
    _validityPeriodOfPassportController.dispose();
    super.dispose();
  }

  bool expand = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: MainColors.kWhiteColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${numberToWord(widget.index + 1)} ${Strings.tourist}',
                style: MainStyles.kBlackColorW500(22.0),
              ),
              CustomIconButtonWidget(
                onTap: () {
                  setState(() {
                    expand = !expand;
                  });
                },
                arrowIcon: true,
              ),
            ],
          ),
          AnimationExpandableSectionWidget(
            expand: expand,
            child: Column(
              children: [
                const SizedBox(height: 17.0),
                CustomTextFieldWidget(
                  controller: _nameController,
                  labelText: Strings.name,
                  fillColor: nameFieldValidate ? MainColors.kLightGreyColor : MainColors.kRedColor.withOpacity(0.15),
                  validator: (String? text) {
                    setState(() {
                      nameFieldValidate = !(text == null || text.isEmpty);
                    });
                    return null;
                  },
                ),
                const SizedBox(height: 8.0),
                CustomTextFieldWidget(
                  controller: _surnameController,
                  labelText: Strings.surname,
                  fillColor: surnameFieldValidate ? MainColors.kLightGreyColor : MainColors.kRedColor.withOpacity(0.15),
                  validator: (String? text) {
                    setState(() {
                      surnameFieldValidate = !(text == null || text.isEmpty);
                    });
                    return null;
                  },
                ),
                const SizedBox(height: 8.0),
                CustomTextFieldWidget(
                  controller: _birthDateController,
                  labelText: Strings.birthDate,
                  fillColor: birthDateFieldValidate ? MainColors.kLightGreyColor : MainColors.kRedColor.withOpacity(0.15),
                  validator: (String? text) {
                    setState(() {
                      birthDateFieldValidate = !(text == null || text.isEmpty);
                    });
                    return null;
                  },
                ),
                const SizedBox(height: 8.0),
                CustomTextFieldWidget(
                  controller: _citizenshipController,
                  labelText: Strings.citizenship,
                  fillColor: citizenshipFieldValidate ? MainColors.kLightGreyColor : MainColors.kRedColor.withOpacity(0.15),
                  validator: (String? text) {
                    setState(() {
                      citizenshipFieldValidate = !(text == null || text.isEmpty);
                    });
                    return null;
                  },
                ),
                const SizedBox(height: 8.0),
                CustomTextFieldWidget(
                  controller: _passportNumberController,
                  labelText: Strings.passportNumber,
                  fillColor: passportNumberFieldValidate ? MainColors.kLightGreyColor : MainColors.kRedColor.withOpacity(0.15),
                  validator: (String? text) {
                    setState(() {
                      passportNumberFieldValidate = !(text == null || text.isEmpty);
                    });
                    return null;
                  },
                ),
                const SizedBox(height: 8.0),
                CustomTextFieldWidget(
                  controller: _validityPeriodOfPassportController,
                  labelText: Strings.validityPeriodOfPassport,
                  fillColor: validityPeriodOfPassportFieldValidate ? MainColors.kLightGreyColor : MainColors.kRedColor.withOpacity(0.15),
                  validator: (String? text) {
                    setState(() {
                      validityPeriodOfPassportFieldValidate = !(text == null || text.isEmpty);
                    });
                    return null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
