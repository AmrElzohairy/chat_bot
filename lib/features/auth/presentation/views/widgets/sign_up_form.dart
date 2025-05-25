import 'package:chat_bot/core/utils/app_images.dart';
import 'package:chat_bot/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/spacing_widgets.dart';
import '../../../../../core/widgets/custom_password_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            labelText: "Full Name",
            controller: TextEditingController(),
            prefixIcon: SvgPicture.asset(
              Assets.imagesPersonOutline,
              fit: BoxFit.scaleDown,
            ),
          ),
          VerticalSpace(height: 20),
          CustomTextFormField(
            labelText: "Username",
            controller: TextEditingController(),
            prefixIcon: SvgPicture.asset(
              Assets.imagesPersonOutline,
              fit: BoxFit.scaleDown,
            ),
          ),
          VerticalSpace(height: 20),
          CustomTextFormField(
            labelText: "Email",
            controller: TextEditingController(),
            prefixIcon: SvgPicture.asset(
              Assets.imagesMailOutline,
              fit: BoxFit.scaleDown,
            ),
          ),
          VerticalSpace(height: 20),
          CustomPasswordField(
            labelText: "Password",
            controller: TextEditingController(),
            prefixIcon: SvgPicture.asset(
              Assets.imagesLockClosedOutline,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}
