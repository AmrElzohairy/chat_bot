import 'package:chat_bot/core/cache/cache_constants.dart';
import 'package:chat_bot/core/cache/cache_helper.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:chat_bot/core/widgets/custom_app_button.dart';
import 'package:chat_bot/core/widgets/custom_snac_bar.dart';
import 'package:chat_bot/features/auth/data/models/sign_in_body_model.dart';
import 'package:chat_bot/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_bot/features/main_views/presentation/views/main_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInBlocConsumer extends StatelessWidget {
  const SignInBlocConsumer({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          CacheHelper.set(key: CacheKeys.isAuthenticated, value: true);
          context.goNamed(MainViews.routeName);
          customSnackBar(context, 'Sign in successful!', AppColors.green);
        } else if (state is SignInFailure) {
          customSnackBar(
            context,
            'Sign in failed: ${state.errMessage}',
            AppColors.red,
          );
        }
      },
      builder: (context, state) {
        return CustomAppButton(
          buttonText: 'Sign In',
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              context.read<SignInCubit>().signIn(
                SignInBodyModel(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                ),
              );
            }
          },
          isLoading: state is SignInLoading ? true : false,
        );
      },
    );
  }
}
