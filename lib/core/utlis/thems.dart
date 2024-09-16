import 'package:flutter/material.dart';

import 'color/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      fontFamily: 'DMSerifDisplay',
      scaffoldBackgroundColor: Appcolor.white,
      appBarTheme:
          AppBarTheme(backgroundColor: Appcolor.black, centerTitle: true),
      // colorScheme: ColorScheme.fromSeed(
      //   seedColor: AppColors.primaryColor,
      //   onSurface: AppColors.blackColor,
      // ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 16, color: Appcolor.grey),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Appcolor.border,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Appcolor.primary,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Appcolor.red,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Appcolor.red,
            )),
      ));
}
