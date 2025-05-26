import 'package:chat_bot/core/helpers/get_current_brightness.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBotFiled extends StatelessWidget {
  const ChatBotFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    getCurrentBrightness(context)
                        ? AppColors.lightTextFieldBorderColor
                        : AppColors.darkTextFieldBorderColor,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TextField(
              decoration: InputDecoration(
                fillColor:
                    getCurrentBrightness(context)
                        ? AppColors.white
                        : AppColors.darkbotSuggetionColor,
                filled: true,
                hintText: 'Type your message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        const HorizontalSpace(width: 5),
        CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          radius: 35.r,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.send, color: AppColors.white, size: 28.sp),
          ),
        ),
      ],
    );
  }
}
