import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({super.key, required this.buttonText, this.onPressed});
  final String buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
    );
  }
}
