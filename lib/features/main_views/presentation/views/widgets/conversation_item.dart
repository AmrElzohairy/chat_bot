import 'package:chat_bot/core/helpers/get_current_brightness.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:chat_bot/features/main_views/data/models/saved_sesions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedSessionItem extends StatelessWidget {
  const SavedSessionItem({super.key, required this.savedSessionData});
  final SavedSessionData savedSessionData;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You: ",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppColors.primaryColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: Text(
                  savedSessionData.userMessages[0].messageContent,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Bot:  ",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppColors.primaryColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: Text(
                  savedSessionData.botMessages[0].messageContent,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
