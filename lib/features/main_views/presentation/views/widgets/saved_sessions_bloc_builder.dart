import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:chat_bot/features/main_views/presentation/cubits/saved_sessions_cubit/saved_sessions_cubit.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/conversations_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedSessionsBlocBuilder extends StatelessWidget {
  const SavedSessionsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedSessionsCubit, SavedSessionsState>(
      builder: (context, state) {
        if (state is SavedSessionsLoading) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        } else if (state is SavedSessionsFailure) {
          return SliverFillRemaining(
            child: Center(child: Text(state.errMessage)),
          );
        } else if (state is SavedSessionsSuccess) {
          return  SevedSessionsSliverList(savedSessions:state.savedSessions,);
        }
        return const SliverFillRemaining(
          child: Center(child: Text('No saved sessions found')),
        );
      },
    );
  }
}
