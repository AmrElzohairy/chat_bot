import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/features/main_views/presentation/views/widgets/profile_image_and_data.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 70),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Profile",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const VerticalSpace(height: 20),
          const ProfileImageAndData(),
        ],
      ),
    );
  }
}
