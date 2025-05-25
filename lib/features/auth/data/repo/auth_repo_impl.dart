import 'dart:developer';

import 'package:chat_bot/core/cache/cache_constants.dart';
import 'package:chat_bot/core/cache/cache_helper.dart';
import 'package:chat_bot/core/errors/failure.dart';
import 'package:chat_bot/core/networking/api_keys.dart';
import 'package:chat_bot/core/networking/api_services.dart';
import 'package:chat_bot/features/auth/data/models/sign_in_body_model.dart';
import 'package:chat_bot/features/auth/data/models/sign_in_model.dart';
import 'package:chat_bot/features/auth/data/models/sign_up_body_model.dart';
import 'package:chat_bot/features/auth/data/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService api;
  @override
  AuthRepoImpl({required this.api});
  @override
  Future<Either<Failure, SignInModel>> signIn(
    SignInBodyModel signInBody,
  ) async {
    try {
      var response = await api.post(ApiKeys.signIn, data: signInBody.toJson());
      var user = SignInModel.fromJson(response);
      cacheUserData(user);
      return right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        log("Error in AuthRepoImpl in signIn method in dio exceptions : $e");
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in AuthRepoImpl in signIn method : $e");
      return left(ServerFailure(e.toString()));
    }
  }

  void cacheUserData(SignInModel user) {
    CacheHelper.setSecureData(key: CacheKeys.accessToken, value: user.token!);
    CacheHelper.setSecureData(key: CacheKeys.userId, value: user.userId!);
    CacheHelper.setSecureData(key: CacheKeys.userName, value: user.userName!);
    CacheHelper.setSecureData(key: CacheKeys.userEmail, value: user.email!);
  }

  @override
  Future<Either<Failure, void>> signUp(SignUpBodyModel signUpBody) async {
    try {
      await api.post(ApiKeys.signUp, data: signUpBody.toJson());
      return const Right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        log("Error in AuthRepoImpl in signUp method in dio exceptions : $e");
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in AuthRepoImpl in signUp method : $e");
      return left(ServerFailure(e.toString()));
    }
  }
}
