import 'package:chat_bot/core/utils/app_images.dart';
import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/core/widgets/custom_app_button.dart';
import 'package:chat_bot/features/auth/presentation/views/sign_up_view.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/custom_social_media_button.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/or_widget.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/row_with_primary_text.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_in_form.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_in_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_logo_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = '/sign_in_view';
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
              SignInTexts(),
              VerticalSpace(height: 40),
              SignInForm(),
              VerticalSpace(height: 30),
              CustomAppButton(
                buttonText: 'Sign In',
                onPressed: () {},
                isLoading: false,
              ),
              VerticalSpace(height: 20),
              OrWidget(),
              VerticalSpace(height: 20),
              CustomSocialMediaButton(
                onTap: () {},
                buttonText: 'Sign in with Google',
                icon: SvgPicture.asset(
                  Assets.imagesGoogle,
                  fit: BoxFit.scaleDown,
                ),
              ),
              VerticalSpace(height: 20),
              RowWithPrimaryText(
                text: 'Don\'t have an account? ',
                primaryText: 'Sign Up',
                onTap: () {
                  context.pushNamed(SignUpView.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
