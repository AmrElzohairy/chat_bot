import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextThemes {
  static TextTheme lightTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    bodyLarge: TextStyle().copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    labelLarge: TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    labelSmall: TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
  );
  static TextTheme darkTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headlineMedium: TextStyle().copyWith(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headlineSmall: TextStyle().copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    bodyLarge: TextStyle().copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodySmall: TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    labelLarge: TextStyle().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    labelMedium: TextStyle().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    labelSmall: TextStyle().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
  );
}
