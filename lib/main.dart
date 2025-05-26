import 'package:chat_bot/core/cache/cache_helper.dart';
import 'package:chat_bot/core/helpers/service_locator.dart';
import 'package:chat_bot/core/routing/app_router.dart';
import 'package:chat_bot/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setupServiceLocator();
  runApp(const ChatBot());
}

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Chat Bot',
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          themeMode: ThemeMode.system,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
        );
      },
    );
  }
}

// Sample screens for demonstration
