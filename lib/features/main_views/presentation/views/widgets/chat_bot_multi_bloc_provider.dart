import 'package:chat_bot/core/helpers/service_locator.dart';
import 'package:chat_bot/features/main_views/data/repo/main_vews_repo.dart';
import 'package:chat_bot/features/main_views/presentation/cubits/start_session_cubit/start_session_cubit.dart';
import 'package:chat_bot/features/main_views/presentation/views/chat_bot_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotMultiBlocProvider extends StatelessWidget {
  const ChatBotMultiBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  StartSessionCubit(mainViewsRepo: getIt<MainViewsRepo>()),
        ),
      ],
      child: const ChatBotView(),
    );
  }
}
