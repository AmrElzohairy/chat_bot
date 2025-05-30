import 'package:chat_bot/features/main_views/presentation/cubits/saved_sessions_cubit/saved_sessions_cubit.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/saved_sessions_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedSesionsView extends StatefulWidget {
  const SavedSesionsView({super.key});

  @override
  State<SavedSesionsView> createState() => _SavedSesionsViewState();
}

class _SavedSesionsViewState extends State<SavedSesionsView> {
  @override
  void initState() {
    super.initState();
    context.read<SavedSessionsCubit>().getSavedSessions();
  }

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
        SavedSessionsBlocBuilder(),
      ],
    );
  }
}
