import 'package:chat_bot/features/main_views/presentation/views/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatBubbleSliverList extends StatelessWidget {
  const ChatBubbleSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ChatBubble(isUserMessage: index % 2 == 0);
      },
    );
  }
}
