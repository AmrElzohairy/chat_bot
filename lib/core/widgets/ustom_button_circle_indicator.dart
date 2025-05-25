import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonCircleIndicator extends StatelessWidget {
  const CustomButtonCircleIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36.w,
      height: 36.h,
      child: const CircularProgressIndicator(
        color: AppColors.white,
        strokeWidth: 3,
      ),
    );
  }
}
