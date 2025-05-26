import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/bot_image_with_suggetions.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});
  static const routeName = '/chat_bot_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text('Chat Bot'),
            ),
            SliverToBoxAdapter(child: VerticalSpace(height: 20)),
            SliverToBoxAdapter(child: BotImageWithSuggetions()),
            SliverToBoxAdapter(child: VerticalSpace(height: 20)),
            SliverToBoxAdapter(child: ChatBubble(isUserMessage: true)),
          ],
        ),
      ),
    );
  }
}
