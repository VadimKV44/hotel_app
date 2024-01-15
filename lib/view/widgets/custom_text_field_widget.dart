import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/styles.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.inputFormatters,
    this.hintText,
    required this.validator,
    required this.fillColor,
  });

  final TextEditingController controller;
  final String labelText;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String? Function(String?)? validator;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      style: MainStyles.kBlackColor3W400(16.0),
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: MainStyles.kGreyColorW500(16.0),
        contentPadding: const EdgeInsets.only(left: 16.0, top: 20.0, bottom: 20.0),
        labelText: labelText,
        labelStyle: const TextStyle(
          height: 4,
          color: MainColors.kGreyColor2,
          fontFamily: 'SF-Pro-Display',
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: fillColor,
        errorStyle: const TextStyle(height: 0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
