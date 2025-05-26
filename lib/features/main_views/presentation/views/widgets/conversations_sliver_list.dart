import 'package:chat_bot/features/main_views/presentation/views/widgets/conversation_item.dart';
import 'package:flutter/material.dart';

class ConversationsSliverList extends StatelessWidget {
  const ConversationsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const ConversationItem();
      },
    );
  }
}
