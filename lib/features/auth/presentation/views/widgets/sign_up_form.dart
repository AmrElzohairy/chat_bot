import 'package:chat_bot/core/utils/app_images.dart';
import 'package:chat_bot/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/spacing_widgets.dart';
import '../../../../../core/widgets/custom_password_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.fullNameController,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
    this.fieldAnimations,
  });
  final TextEditingController fullNameController;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;
  final List<Animation<double>>? fieldAnimations;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // Animated Full Name Field
          _buildAnimatedField(
            index: 0,
            slideDirection: const Offset(-0.3, 0),
            child: _buildFullNameField(),
          ),
          VerticalSpace(height: 20),
          // Animated Username Field
          _buildAnimatedField(
            index: 1,
            slideDirection: const Offset(0.3, 0),
            child: _buildUsernameField(),
          ),
          VerticalSpace(height: 20),
          // Animated Email Field
          _buildAnimatedField(
            index: 2,
            slideDirection: const Offset(-0.3, 0),
            child: _buildEmailField(),
          ),
          VerticalSpace(height: 20),
          // Animated Password Field
          _buildAnimatedField(
            index: 3,
            slideDirection: const Offset(0.3, 0),
            child: _buildPasswordField(),
          ),
          VerticalSpace(height: 20),
          // Animated Confirm Password Field
          _buildAnimatedField(
            index: 4,
            slideDirection: const Offset(-0.3, 0),
            child: _buildConfirmPasswordField(),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedField({
    required int index,
    required Offset slideDirection,
    required Widget child,
  }) {
    if (fieldAnimations != null && fieldAnimations!.length > index) {
      return FadeTransition(
        opacity: fieldAnimations![index],
        child: SlideTransition(
          position: Tween<Offset>(
            begin: slideDirection,
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: fieldAnimations![index],
              curve: Curves.easeOut,
            ),
          ),
          child: child,
        ),
      );
    }
    return child;
  }

  Widget _buildFullNameField() {
    return CustomTextFormField(
      labelText: "Full Name",
      controller: fullNameController,
      prefixIcon: SvgPicture.asset(
        Assets.imagesPersonOutline,
        fit: BoxFit.scaleDown,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your full name';
        }
        return null;
      },
    );
  }

  Widget _buildUsernameField() {
    return CustomTextFormField(
      labelText: "Username",
      controller: usernameController,
      prefixIcon: SvgPicture.asset(
        Assets.imagesPersonOutline,
        fit: BoxFit.scaleDown,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return CustomTextFormField(
      labelText: "Email",
      controller: emailController,
      prefixIcon: SvgPicture.asset(
        Assets.imagesMailOutline,
        fit: BoxFit.scaleDown,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
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
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomPasswordField(
      labelText: "Confirm Password",
      controller: confirmPasswordController,
      prefixIcon: SvgPicture.asset(
        Assets.imagesLockClosedOutline,
        fit: BoxFit.scaleDown,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        } else if (value != passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
