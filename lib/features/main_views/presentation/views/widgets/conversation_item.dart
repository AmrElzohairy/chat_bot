import 'package:chat_bot/core/helpers/get_current_brightness.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedSessionItem extends StatelessWidget {
  const SavedSessionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:
            getCurrentBrightness(context)
                ? AppColors.lightbotSuggetionColor
                : AppColors.darkbotSuggetionColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        "Tell me a joke about chickens." * 5,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
