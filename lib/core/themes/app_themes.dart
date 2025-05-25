import 'package:chat_bot/core/themes/elevated_button_themes.dart';
import 'package:chat_bot/core/themes/text_form_field_themes.dart';
import 'package:chat_bot/core/themes/text_themes.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextThemes.lightTheme,
    elevatedButtonTheme: ElevatedButtonThemes.lightElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldThemes.lightInputeDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextThemes.darkTheme,
    elevatedButtonTheme: ElevatedButtonThemes.darkElevatedButtonTheme,
    inputDecorationTheme: TextFormFieldThemes.darkInputeDecorationTheme,
  );
}
