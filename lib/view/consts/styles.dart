import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';

abstract class MainStyles {
  ///   FontWeight W400
  static TextStyle kGreyColorW400(double fonSize) {
    return TextStyle(
      color: MainColors.kGreyColor,
      fontSize: fonSize,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF-Pro-Display',
    );
  }

  static TextStyle kBlackColorW400(double fonSize, [double withOpacity = 1.0]) {
    return TextStyle(
      color: MainColors.kBlackColor.withOpacity(withOpacity),
      fontSize: fonSize,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF-Pro-Display',
    );
  }

  ///   FontWeight W500
  static TextStyle kBlackColorW500(double fonSize) {
    return TextStyle(
      color: MainColors.kBlackColor,
      fontSize: fonSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF-Pro-Display',
    );
  }

  static TextStyle kOrangeColorW500(double fonSize) {
    return TextStyle(
      color: MainColors.kOrangeColor,
      fontSize: fonSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF-Pro-Display',
    );
  }

  static TextStyle kBlueColorW500(double fonSize) {
    return TextStyle(
      color: MainColors.kBlueColor,
      fontSize: fonSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF-Pro-Display',
    );
  }

  static TextStyle kGreyColorW500(double fonSize) {
    return TextStyle(
      color: MainColors.kGreyColor,
      fontSize: fonSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF-Pro-Display',
    );
  }

  static TextStyle kBlackColor2W500(double fonSize) {
    return TextStyle(
      color: MainColors.kBlackColor2,
      fontSize: fonSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF-Pro-Display',
    );
  }

  static TextStyle kWhiteColorW500(double fonSize) {
    return TextStyle(
      color: MainColors.kWhiteColor,
      fontSize: fonSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'SF-Pro-Display',
    );
  }

  ///   FontWeight W600
  static TextStyle kBlackColorW600(double fonSize) {
    return TextStyle(
      color: MainColors.kBlackColor,
      fontSize: fonSize,
      fontWeight: FontWeight.w600,
      fontFamily: 'SF-Pro-Display',
    );
  }
}