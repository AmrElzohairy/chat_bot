import 'package:chat_bot/core/networking/api_services.dart';
import 'package:chat_bot/features/auth/data/repo/auth_repo.dart';
import 'package:chat_bot/features/auth/data/repo/auth_repo_impl.dart';
import 'package:chat_bot/features/main_views/data/repo/main_vews_repo.dart';
import 'package:chat_bot/features/main_views/data/repo/main_views_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(api: getIt<ApiService>()));
  getIt.registerSingleton<MainViewsRepo>(MainViewsRepoImpl(api: getIt<ApiService>()));
}
