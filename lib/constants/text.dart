import 'package:acars_mobile/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomTextTheme {
  TextTheme getTextTheme(BuildContext context) {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: setHeight(36),
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
          fontSize: setHeight(24),
          fontWeight: FontWeight.w500,
          color: Colors.white),
      titleSmall: TextStyle(
        fontSize: setHeight(20),
      ),
      labelMedium: TextStyle(
        fontSize: setHeight(20),
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontSize: setHeight(20),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
