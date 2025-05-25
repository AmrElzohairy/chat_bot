import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/get_current_brightness.dart';
import '../../../../../../core/utils/app_colors.dart';

class SignInTexts extends StatelessWidget {
  const SignInTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 335.w,
          child: Text(
            'Welcome Back!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SizedBox(
          width: 335.w,
          child: Text(
            'Enter your login details',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color:
                  getCurrentBrightness(context)
                      ? AppColors.lightSecondaryText
                      : AppColors.darkSecondaryText,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
