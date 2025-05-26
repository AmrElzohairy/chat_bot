import 'package:chat_bot/core/utils/app_images.dart';
import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:flutter/material.dart';

class ProfileImageAndData extends StatelessWidget {
  const ProfileImageAndData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(Assets.imagesHisoka),
        ),
        const VerticalSpace(height: 10),
        Text("Hisoka Morow", style: Theme.of(context).textTheme.bodyLarge),
        Text(
          "hisoka@boredom.com",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
