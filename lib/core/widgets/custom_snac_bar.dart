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
      content: Text(message),
      backgroundColor: color,
    ),
  );
}
