import 'package:chat_bot/core/widgets/ustom_button_circle_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.isLoading = false,
  });
  final String buttonText;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: isLoading ? CustomButtonCircleIndicator() : Text(buttonText),
      ),
    );
  }
}
