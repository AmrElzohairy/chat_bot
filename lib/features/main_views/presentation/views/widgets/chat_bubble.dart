import 'package:chat_bot/core/helpers/get_current_brightness.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.isUserMessage});
  final bool isUserMessage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
        decoration: BoxDecoration(
          color:
              isUserMessage
                  ? AppColors.primaryColor
                  : getCurrentBrightness(context)
                  ? AppColors.lightbotSuggetionColor
                  : AppColors.darkbotSuggetionColor,
          borderRadius:
              isUserMessage
                  ? const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  )
                  : const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
        ),
        child: Text(
          "Hello, There i want to ask you something.",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color:
                isUserMessage
                    ? AppColors.white
                    : getCurrentBrightness(context)
                    ? AppColors.black
                    : AppColors.white,
          ),
        ),
      ),
    );
  }
}
