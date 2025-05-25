import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:chat_bot/core/utils/app_images.dart';
import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/get_current_brightness.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = '/sign_in_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              VerticalSpace(height: 70),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(Assets.imagesAppLogo),
              ),
              VerticalSpace(height: 20),
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
          ),
        ),
      ),
    );
  }
}
