import 'package:chat_bot/features/main_views/presentation/cubits/chat_messages_cubit/chat_messages_cubit.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/bot_image_with_suggetions.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBubbleSliverList extends StatelessWidget {
  const ChatBubbleSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatMessagesCubit, ChatMessagesState>(
      builder: (context, state) {
        if (state.messages.isEmpty) {
          return const SliverToBoxAdapter(child: BotImageWithSuggetions());
        }

        return SliverList.builder(
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            final message = state.messages[index];
            return ChatBubble(message: message);
          },
        );
      },
    );
  }
}
