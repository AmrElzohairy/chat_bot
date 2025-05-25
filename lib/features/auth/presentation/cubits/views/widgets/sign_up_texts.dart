import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/get_current_brightness.dart';
import '../../../../../../core/utils/app_colors.dart';

class SignUpTexts extends StatelessWidget {
  const SignUpTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 335.w,
          child: Text(
            'Sign Up!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SizedBox(
          width: 335.w,
          child: Text(
            'Create a new account',
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
