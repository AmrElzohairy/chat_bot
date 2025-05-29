import 'package:chat_bot/core/cache/cache_constants.dart';
import 'package:chat_bot/core/cache/cache_helper.dart';
import 'package:chat_bot/core/helpers/get_current_brightness.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/features/main_views/data/models/chat_body_model.dart';
import 'package:chat_bot/features/main_views/presentation/cubits/chat_messages_cubit/chat_messages_cubit.dart';
import 'package:chat_bot/features/main_views/presentation/cubits/send_message_cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBotFiled extends StatefulWidget {
  const ChatBotFiled({super.key});

  @override
  State<ChatBotFiled> createState() => _ChatBotFiledState();
}

class _ChatBotFiledState extends State<ChatBotFiled> {
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    getSessionId();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

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
              controller: _messageController,
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
          child: BlocListener<SendMessageCubit, SendMessageState>(
            listener: (context, state) {
              if (state is SendMessageSuccess) {
                // Add bot response to chat
                context.read<ChatMessagesCubit>().addBotResponse(
                  state.chatResponse,
                );
              } else if (state is SendMessageFailure) {
                // Handle error
                context.read<ChatMessagesCubit>().handleMessageError(
                  state.errMessage,
                );
              }
            },
            child: IconButton(
              onPressed: () {
                final message = _messageController.text.trim();
                if (message.isNotEmpty) {
                  // Add user message to chat immediately
                  context.read<ChatMessagesCubit>().addUserMessage(message);
                  // Send message to API
                  context.read<SendMessageCubit>().sendMessage(
                    getSessionId()!,
                    ChatBodyModel(message: message),
                  );
                  _messageController.clear();
                }
              },
              icon: Icon(Icons.send, color: AppColors.white, size: 28.sp),
            ),
          ),
        ),
      ],
    );
  }

  String? getSessionId() {
    final sessionId = CacheHelper.getString(key: CacheKeys.sessionId);
    return sessionId;
  }
}
