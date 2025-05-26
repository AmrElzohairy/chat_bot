import 'package:chat_bot/core/helpers/get_current_brightness.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });
  final String title;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListTile(
          dense: true,
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            image,
            colorFilter: ColorFilter.mode(
              getCurrentBrightness(context) ? AppColors.black : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
          trailing: Icon(Icons.arrow_forward_ios, size: 20.sp),
        ),
      ),
    );
  }
}
