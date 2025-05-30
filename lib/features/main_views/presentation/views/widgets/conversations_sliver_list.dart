import 'package:chat_bot/features/main_views/presentation/views/widgets/conversation_item.dart';
import 'package:flutter/material.dart';

class SevedSessionsSliverList extends StatelessWidget {
  const SevedSessionsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const SavedSessionItem();
      },
    );
  }
}
