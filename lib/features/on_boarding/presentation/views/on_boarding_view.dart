import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/core/widgets/custom_app_button.dart';
import 'package:chat_bot/features/auth/presentation/views/sign_in_view.dart';
import 'package:chat_bot/features/on_boarding/presentation/views/widgets/on_boarding_image.dart';
import 'package:chat_bot/features/on_boarding/presentation/views/widgets/on_boarding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = '/onBoarding_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            VerticalSpace(height: 180),
            OnBoardingImage(),
            VerticalSpace(height: 20),
            OnBoardingTexts(),
            Spacer(),
            CustomAppButton(
              buttonText: 'Get Started',
              onPressed: () {
                context.goNamed(SignInView.routeName);
              },
            ),
            VerticalSpace(height: 80),
          ],
        ),
      ),
    );
  }
}
