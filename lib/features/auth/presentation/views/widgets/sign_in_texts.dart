import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/get_current_brightness.dart';
import '../../../../../core/utils/app_colors.dart';

class SignInTexts extends StatelessWidget {
  const SignInTexts({
    super.key,
    required this.titleAnimation,
    required this.subtitleAnimation,
  });

  final Animation<double> titleAnimation;
  final Animation<double> subtitleAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeTransition(
          opacity: titleAnimation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.3),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: titleAnimation, curve: Curves.easeOut),
            ),
            child: SizedBox(
              width: 335.w,
              child: Text(
                'Welcome Back!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        FadeTransition(
          opacity: subtitleAnimation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.3),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: subtitleAnimation, curve: Curves.easeOut),
            ),
            child: SizedBox(
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
          ),
        ),
      ],
    );
  }
}
