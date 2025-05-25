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
    final token = CacheHelper.getString(key: CacheKeys.accessToken);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      AppRouter.router.goNamed(SignInView.routeName);
    }
    if (err.response?.statusCode == 403) {
      AppRouter.router.goNamed(SignInView.routeName);
    }

    return handler.next(err);
  }
}
