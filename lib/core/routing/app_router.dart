import 'package:chat_bot/core/cache/cache_constants.dart';
import 'package:chat_bot/core/cache/cache_helper.dart';
import 'package:chat_bot/core/helpers/service_locator.dart';
import 'package:chat_bot/features/auth/data/repo/auth_repo.dart';
import 'package:chat_bot/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_bot/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_bot/features/auth/presentation/views/sign_in_view.dart';
import 'package:chat_bot/features/auth/presentation/views/sign_up_view.dart';
import 'package:chat_bot/features/main_views/data/repo/main_vews_repo.dart';
import 'package:chat_bot/features/main_views/presentation/cubits/cubit/start_session_cubit.dart';
import 'package:chat_bot/features/main_views/presentation/views/main_views.dart';
import 'package:chat_bot/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: getCurrentRoute(),
    routes: [
      GoRoute(
        path: OnBoardingView.routeName,
        name: OnBoardingView.routeName,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: SignInView.routeName,
        name: SignInView.routeName,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SignInCubit(authRepo: getIt<AuthRepo>()),
              child: const SignInView(),
            ),
      ),
      GoRoute(
        path: SignUpView.routeName,
        name: SignUpView.routeName,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
              child: const SignUpView(),
            ),
      ),
      GoRoute(
        path: MainViews.routeName,
        name: MainViews.routeName,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) => StartSessionCubit(
                        mainViewsRepo: getIt<MainViewsRepo>(),
                      ),
                ),
              ],
              child: const MainViews(),
            ),
      ),
    ],
    errorBuilder:
        (context, state) =>
            const Scaffold(body: Center(child: Text('Page not found'))),
  );
}

String getCurrentRoute() {
  bool isOnBoardingSeen =
      CacheHelper.getBool(key: CacheKeys.isOnBoardingSeen) ?? false;
  bool isAuthenticated =
      CacheHelper.getBool(key: CacheKeys.isAuthenticated) ?? false;
  if (!isOnBoardingSeen) {
    return OnBoardingView.routeName;
  } else if (!isAuthenticated) {
    return SignInView.routeName;
  } else {
    return MainViews.routeName;
  }
}
