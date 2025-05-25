import 'dart:developer';

import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:chat_bot/core/widgets/custom_app_button.dart';
import 'package:chat_bot/core/widgets/custom_snac_bar.dart';
import 'package:chat_bot/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/sign_up_body_model.dart';

class SignUpBlocConsumer extends StatelessWidget {
  const SignUpBlocConsumer({
    super.key,
    required this.formKey,
    required this.fullNameController,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Sign up successful! , Check your email for verification.',
              ),
            ),
          );
          customSnackBar(
            context,
            'Sign up successful! , Check your email for verification.',
            AppColors.green,
          );
          context.pop();
        } else if (state is SignUpFailure) {
          customSnackBar(
            context,
            'Sign up failed: ${state.errMessage}',
            AppColors.red,
          );
        }
      },
      builder: (context, state) {
        return CustomAppButton(
          buttonText: 'Sign Up',
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              context.read<SignUpCubit>().signUp(
                SignUpBodyModel(
                  fullName: fullNameController.text.trim(),
                  userName: usernameController.text.trim(),
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                ),
              );
            }
            log("Sign up button pressed");
          },
          isLoading: false,
        );
      },
    );
  }
}
