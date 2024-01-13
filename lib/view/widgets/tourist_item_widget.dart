import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';
import 'package:hotel_app/view/widgets/animation_expandable_section_widget.dart';
import 'package:hotel_app/view/widgets/custom_icon_button_widget.dart';
import 'package:hotel_app/view/widgets/custom_text_field_widget.dart';

class TouristItemWidget extends StatefulWidget {
  const TouristItemWidget({super.key});

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
                'Первый турист',
                style: MainStyles.kBlackColorW500(22.0),
              ),
              CustomIconButtonWidget(
                onTap: () {
                  setState(() {
                    expand =! expand;
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
                ),
                const SizedBox(height: 8.0),
                CustomTextFieldWidget(
                  controller: _surnameController,
                  labelText: Strings.surname,
                ),
                const SizedBox(height: 8.0),
                CustomTextFieldWidget(
                  controller: _birthDateController,
                  labelText: Strings.birthDate,
                ),
                const SizedBox(height: 8.0),
                CustomTextFieldWidget(
                  controller: _citizenshipController,
                  labelText: Strings.citizenship,
                ),
                const SizedBox(height: 8.0),
                CustomTextFieldWidget(
                  controller: _passportNumberController,
                  labelText: Strings.passportNumber,
                ),
                const SizedBox(height: 8.0),
                CustomTextFieldWidget(
                  controller: _validityPeriodOfPassportController,
                  labelText: Strings.validityPeriodOfPassport,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
