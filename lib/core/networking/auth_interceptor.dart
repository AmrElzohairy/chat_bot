import 'dart:developer';

import 'package:chat_bot/core/cache/cache_constants.dart';
import 'package:chat_bot/core/cache/cache_helper.dart';
import 'package:chat_bot/core/routing/app_router.dart';
import 'package:chat_bot/features/auth/presentation/views/sign_in_view.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await CacheHelper.getSecureData(key: CacheKeys.accessToken);

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      log('🔑 Token added to request: ${options.path}');
      log(
        '🔑 Token (first 20 chars): ${token.substring(0, token.length > 20 ? 20 : token.length)}...',
      );
    } else {
      log('⚠️ No token found for request: ${options.path}');
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    log('🚨 API Error: ${err.response?.statusCode} - ${err.message}');
    log('🚨 Request path: ${err.requestOptions.path}');

    if (err.response?.statusCode == 401) {
      log('🚨 Unauthorized - redirecting to sign in');
      // Clear the stored token since it's invalid
      await CacheHelper.deleteSecureData(key: CacheKeys.accessToken);
      AppRouter.router.goNamed(SignInView.routeName);
    }
    if (err.response?.statusCode == 403) {
      log('🚨 Forbidden - redirecting to sign in');
      AppRouter.router.goNamed(SignInView.routeName);
    }

    return handler.next(err);
  }
}
