import 'package:chat_bot/core/helpers/get_current_brightness.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:chat_bot/features/main_views/data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});

  final MessageModel message;

  bool get isUserMessage => message.type == MessageType.user;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child:
            message.isLoading
                ? _buildLoadingIndicator(context)
                : _buildMessageContent(context),
      ),
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 15.w,
          height: 15.h,
          child: CircularProgressIndicator(
            strokeWidth: 1,
            valueColor: AlwaysStoppedAnimation<Color>(
              getCurrentBrightness(context) ? AppColors.black : AppColors.white,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          'Typing...',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color:
                getCurrentBrightness(context)
                    ? AppColors.black
                    : AppColors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildMessageContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message.content,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color:
                isUserMessage
                    ? AppColors.white
                    : getCurrentBrightness(context)
                    ? AppColors.black
                    : AppColors.white,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          _formatTime(message.timestamp),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: (isUserMessage
                    ? AppColors.white
                    : getCurrentBrightness(context)
                    ? AppColors.black
                    : AppColors.white)
                .withValues(alpha: 0.7),
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else {
      return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
    }
  }
}
