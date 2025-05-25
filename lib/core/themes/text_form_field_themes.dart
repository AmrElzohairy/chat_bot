import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class TextFormFieldThemes {
  static InputDecorationTheme lightInputeDecorationTheme = InputDecorationTheme(
    labelStyle: const TextStyle(
      color: AppColors.lightSecondaryText,
      fontSize: 14,
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.3),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.lightTextFieldBorderColor,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 1),
    ),
  );

  static InputDecorationTheme darkInputeDecorationTheme = InputDecorationTheme(
    labelStyle: const TextStyle(
      color: AppColors.darkSecondaryText,
      fontSize: 14,
    ),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.3),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.darkTextFieldBorderColor,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 1),
    ),
  );
}
