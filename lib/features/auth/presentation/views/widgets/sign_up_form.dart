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
  });
  final TextEditingController fullNameController;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
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
          ),
          VerticalSpace(height: 20),
          CustomTextFormField(
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
          ),
          VerticalSpace(height: 20),
          CustomTextFormField(
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
          ),
          VerticalSpace(height: 20),
          CustomPasswordField(
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
          ),
          VerticalSpace(height: 20),
          CustomPasswordField(
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
          ),
        ],
      ),
    );
  }
}
