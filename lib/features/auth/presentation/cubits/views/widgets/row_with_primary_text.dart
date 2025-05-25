import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RowWithPrimaryText extends StatelessWidget {
  const RowWithPrimaryText({
    super.key,
    this.onTap,
    required this.text,
    required this.primaryText,
  });
  final void Function()? onTap;
  final String text;
  final String primaryText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            primaryText,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
