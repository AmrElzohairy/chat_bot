import 'package:chat_bot/core/helpers/get_current_brightness.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:chat_bot/core/utils/app_images.dart';
import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BotImageWithSuggetions extends StatelessWidget {
  const BotImageWithSuggetions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.imagesRobot, height: 200.h),
        const VerticalSpace(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 18.h),
          decoration: BoxDecoration(
            color:
                getCurrentBrightness(context)
                    ? AppColors.lightbotSuggetionColor
                    : AppColors.darkbotSuggetionColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              SvgPicture.asset(Assets.imagesThreeStarsIcon),
              const HorizontalSpace(width: 10),
              Text(
                "Hello, You can Ask me anything.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
