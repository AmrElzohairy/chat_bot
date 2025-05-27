import 'dart:developer';

import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/features/main_views/data/models/start_chat_session_body.dart';
import 'package:chat_bot/features/main_views/presentation/cubits/cubit/start_session_cubit.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/bot_image_with_suggetions.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/chat_bot_field.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/chat_bubble_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotView extends StatefulWidget {
  const ChatBotView({super.key});
  static const routeName = '/chat_bot_view';

  @override
  State<ChatBotView> createState() => _ChatBotViewState();
}

class _ChatBotViewState extends State<ChatBotView> {
  @override
  void initState() {
    _startSesson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text('Chat Bot'),
              ),
              SliverToBoxAdapter(child: VerticalSpace(height: 20)),
              SliverToBoxAdapter(child: BotImageWithSuggetions()),
              SliverToBoxAdapter(child: VerticalSpace(height: 20)),
              ChatBubbleSliverList(),
              SliverToBoxAdapter(child: VerticalSpace(height: 80)),
            ],
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: ChatBotFiled()),
        ],
      ),
    );
  }

  void _startSesson() {
    try {
      context.read<StartSessionCubit>().startChatSession(
        const StartChatSessionBody(
          botId: "79492a69-23a6-469a-cd59-08dd9d4bc7bf",
          userId: "892aa5a5-2de4-4094-a192-b902f61cf17e",
        ),
      );
      log("Chat session started successfully");
    } on Exception catch (e) {
      log("Error in ChatBotView in startSesson method : $e");
    }
  }
}
