import 'package:chat_bot/features/main_views/data/models/saved_sesions_model.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/conversation_item.dart';
import 'package:flutter/material.dart';

class SevedSessionsSliverList extends StatelessWidget {
  const SevedSessionsSliverList({super.key, required this.savedSessions});
  final List<SavedSessionData> savedSessions;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: savedSessions.length,
      itemBuilder: (context, index) {
        return SavedSessionItem(savedSessionData: savedSessions[index]);
      },
    );
  }
}
