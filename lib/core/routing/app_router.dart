import 'package:chat_bot/features/auth/presentation/views/sign_in_view.dart';
import 'package:chat_bot/features/auth/presentation/views/sign_up_view.dart';
import 'package:chat_bot/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: OnBoardingView.routeName,
    routes: [
      GoRoute(
        path: OnBoardingView.routeName,
        name: OnBoardingView.routeName,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: SignInView.routeName,
        name: SignInView.routeName,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: SignUpView.routeName,
        name: SignUpView.routeName,
        builder: (context, state) => const SignUpView(),
      ),
    ],
    errorBuilder:
        (context, state) =>
            const Scaffold(body: Center(child: Text('Page not found'))),
  );
}
