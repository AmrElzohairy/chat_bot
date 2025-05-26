import 'package:chat_bot/core/utils/app_images.dart';
import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/profile_image_and_data.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const VerticalSpace(height: 70),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Profile",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const VerticalSpace(height: 40),
          const ProfileImageAndData(),
          const VerticalSpace(height: 60),
          ProfileListTile(
            image: Assets.imagesSettings,
            title: "Settings",
            onTap: () {},
          ),
          const VerticalSpace(height: 5),
          ProfileListTile(
            image: Assets.imagesNotificationsSharp,
            title: "Notifications",
            onTap: () {},
          ),
          const VerticalSpace(height: 5),
          ProfileListTile(
            image: Assets.imagesHistoryIcon,
            title: "History",
            onTap: () {},
          ),
          const VerticalSpace(height: 5),
          ProfileListTile(
            image: Assets.imagesPrivacyAndPolicy,
            title: "Privacy & Policy",
            onTap: () {},
          ),
          const VerticalSpace(height: 5),
          ProfileListTile(
            image: Assets.imagesLogoutIcon,
            title: "Logout",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
