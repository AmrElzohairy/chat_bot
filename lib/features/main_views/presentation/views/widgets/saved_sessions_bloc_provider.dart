import 'package:chat_bot/core/helpers/service_locator.dart';
import 'package:chat_bot/features/main_views/data/repo/main_vews_repo.dart';
import 'package:chat_bot/features/main_views/presentation/cubits/saved_sessions_cubit/saved_sessions_cubit.dart';
import 'package:chat_bot/features/main_views/presentation/views/saved_sesions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedSessionsBlocProvider extends StatelessWidget {
  const SavedSessionsBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              SavedSessionsCubit(mainViewsRepo: getIt<MainViewsRepo>()),
      child: const SavedSesionsView(),
    );
  }
}
