import 'package:chat_bot/core/networking/api_keys.dart';
import 'package:chat_bot/core/networking/auth_interceptor.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio}) {
    dio.options.baseUrl = ApiKeys.baserUrl;
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        error: true,
      ),
    );
  }

  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    final response = await dio.delete(
      path,
      data: isFromData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    final response = await dio.patch(
      path,
      data: isFromData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    final response = await dio.post(
      path,
      data: isFromData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
