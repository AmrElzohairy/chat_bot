import 'package:chat_bot/core/utils/app_images.dart';
import 'package:chat_bot/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/spacing_widgets.dart';
import '../../../../../core/widgets/custom_password_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    this.fieldAnimations,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final List<Animation<double>>? fieldAnimations;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // Animated Email Field
          if (fieldAnimations != null && fieldAnimations!.isNotEmpty)
            FadeTransition(
              opacity: fieldAnimations![0],
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-0.3, 0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: fieldAnimations![0],
                    curve: Curves.easeOut,
                  ),
                ),
                child: _buildEmailField(),
              ),
            )
          else
            _buildEmailField(),
          VerticalSpace(height: 20),
          // Animated Password Field
          if (fieldAnimations != null && fieldAnimations!.length > 1)
            FadeTransition(
              opacity: fieldAnimations![1],
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.3, 0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: fieldAnimations![1],
                    curve: Curves.easeOut,
                  ),
                ),
                child: _buildPasswordField(),
              ),
            )
          else
            _buildPasswordField(),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextFormField(
      labelText: "Email or Username",
      controller: emailController,
      prefixIcon: SvgPicture.asset(
        Assets.imagesMailOutline,
        fit: BoxFit.scaleDown,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email or username';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return CustomPasswordField(
      labelText: "Password",
      controller: passwordController,
      prefixIcon: SvgPicture.asset(
        Assets.imagesLockClosedOutline,
        fit: BoxFit.scaleDown,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
