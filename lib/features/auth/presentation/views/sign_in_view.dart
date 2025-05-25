import 'package:chat_bot/core/utils/app_images.dart';
import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/features/auth/presentation/views/sign_up_view.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/custom_social_media_button.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/or_widget.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/row_with_primary_text.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_in_bloc_consumer.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_in_form.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_in_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_logo_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static const routeName = '/sign_in_view';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

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
              SignInForm(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              VerticalSpace(height: 30),
              SignInBlocConsumer(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
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
