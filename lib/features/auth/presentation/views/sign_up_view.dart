import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/core/widgets/custom_app_button.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/row_with_primary_text.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_up_texts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_logo_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = '/sign_up_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              VerticalSpace(height: 90),
              AppLogoWidget(),
              VerticalSpace(height: 20),
              SignUpTexts(),
              VerticalSpace(height: 40),
              SignUpForm(),
              VerticalSpace(height: 30),
              CustomAppButton(
                buttonText: 'Sign Up',
                onPressed: () {},
                isLoading: false,
              ),
              VerticalSpace(height: 20),
              RowWithPrimaryText(
                text: 'Already have an account? ',
                primaryText: 'Sign In',
                onTap: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
