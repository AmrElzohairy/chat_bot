import 'dart:developer';

import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/features/main_views/presentation/cubits/chat_messages_cubit/chat_messages_cubit.dart';
import 'package:chat_bot/features/main_views/presentation/cubits/start_session_cubit/start_session_cubit.dart';
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
    return BlocProvider(
      create: (context) => ChatMessagesCubit(),
      child: const Padding(
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
                ChatBubbleSliverList(),
                SliverToBoxAdapter(child: VerticalSpace(height: 80)),
              ],
            ),
            Positioned(bottom: 0, left: 0, right: 0, child: ChatBotFiled()),
          ],
        ),
      ),
    );
  }

  void _startSesson() {
    try {
      context.read<StartSessionCubit>().startChatSession();
      log("Chat session started successfully");
    } on Exception catch (e) {
      log("Error in ChatBotView in startSesson method : $e");
    }
  }
}
