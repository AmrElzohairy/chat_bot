import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

customSnackBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: const Duration(seconds: 3),
      elevation: 5,
      showCloseIcon: true,
      content: Text(
        message,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppColors.white),
      ),
      backgroundColor: color,
    ),
  );
}
