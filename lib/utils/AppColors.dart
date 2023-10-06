import 'package:flutter/material.dart';

class AppColors {
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Color(0xff373636);
  static const Color grayColor = Color(0xffF8F8F8);
  static const Color grayLiteColor = Color(0xffBCC4CC);
  static const Color grayDarkColor = Color(0xffA6AAAC);
  static List<BoxShadow> boxShadow= [
    BoxShadow(
      color: AppColors.grayColor,
      offset: const Offset(
        1.0,
        1.0,
      ),
      blurRadius: 1.0,
      spreadRadius: 2.0,
    ),
  ];
}
