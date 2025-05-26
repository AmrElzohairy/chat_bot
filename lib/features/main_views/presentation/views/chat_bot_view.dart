import 'package:flutter/material.dart';

class ChatBotView extends StatelessWidget {
  const ChatBotView({super.key});
  static const routeName = '/chat_bot_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Chat Bot View')));
  }
}
