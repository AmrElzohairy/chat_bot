import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/get_current_brightness.dart';
import '../../../../../core/utils/spacing_widgets.dart';

class CustomSocialMediaButton extends StatelessWidget {
  const CustomSocialMediaButton({
    super.key,
    this.onTap,
    required this.buttonText,
    required this.icon,
  });
  final void Function()? onTap;
  final String buttonText;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: 94.w,
          right: 94.w,
          top: 18.h,
          bottom: 18.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color:
                getCurrentBrightness(context)
                    ? AppColors.black.withValues(alpha: 0.3)
                    : AppColors.white,
          ),
        ),
        child: Row(
          children: [
            icon,
            HorizontalSpace(width: 10),
            Text(buttonText, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
