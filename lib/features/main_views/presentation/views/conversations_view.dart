import 'package:chat_bot/features/main_views/presentation/views/widgets/conversations_sliver_list.dart';
import 'package:flutter/material.dart';

class ConversationsView extends StatelessWidget {
  const ConversationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text('Conversations'),
        ),
        SliverToBoxAdapter(child: Divider(height: 1, thickness: 2)),
        ConversationsSliverList(),
      ],
    );
  }
}
