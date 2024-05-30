import 'package:flutter/material.dart';
class CustomTextTheme {
  TextTheme getTextTheme(BuildContext context) {
    return const TextTheme(
      titleLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
             fontSize: 20,
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
