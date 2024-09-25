import 'package:flutter/material.dart';
import 'package:quote_app/core/utils/app_colors.dart';
import 'package:quote_app/core/utils/app_strings.dart';

class AppThemes {
  static ThemeData blueAppThemeLight() {
    return ThemeData(
      //[primarySwatch] is used to set the theme color
      primarySwatch: Colors.blue,
      //[hintColor] is used to set the hint text color
      hintColor: AppColors.hint,
      //[brightness] is used to set the theme light or dark
      brightness: Brightness.light,
      //[fontFamily] is used to set the font family
      fontFamily: AppStrings.tajwalFontFamily,
      //[scaffoldBackgroundColor] is used to set the background color
      scaffoldBackgroundColor: Colors.white,
      //[appBarTheme] is used to set the app bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.primaryColor,
          elevation: 0,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 25,
          )),
      //[textButtonTheme] is used to set the text button theme
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16)),
        ),
      ),
    );
  }

  static ThemeData blueAppThemeDark() {
    return ThemeData(
        primarySwatch: Colors.blue,
        hintColor: AppColors.hint,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey);
  }
}
