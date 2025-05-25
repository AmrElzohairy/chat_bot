import 'package:chat_bot/core/helpers/get_current_brightness.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingTexts extends StatelessWidget {
  const OnBoardingTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your One-Stop Name\nSolution',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        VerticalSpace(height: 20),
        SizedBox(
          width: 335.w,
          child: Text(
            'Simplify the process of finding the perfect and professional name.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color:
                  getCurrentBrightness(context)
                      ? AppColors.lightSecondaryText
                      : AppColors.darkSecondaryText,
              fontSize: 17.sp,
            ),
          ),
        ),
      ],
    );
  }
}
