
import 'package:chat_bot/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SvgPicture.asset(Assets.imagesAppLogo),
    );
  }
}
