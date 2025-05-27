import 'dart:developer';

import 'package:chat_bot/core/cache/cache_constants.dart';
import 'package:chat_bot/core/cache/cache_helper.dart';
import 'package:chat_bot/core/errors/failure.dart';
import 'package:chat_bot/core/networking/api_keys.dart';
import 'package:chat_bot/core/networking/api_services.dart';
import 'package:chat_bot/features/main_views/data/models/start_chat_session_body.dart';
import 'package:chat_bot/features/main_views/data/models/start_chat_session_model.dart';
import 'package:chat_bot/features/main_views/data/repo/main_vews_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MainViewsRepoImpl extends MainViewsRepo {
  final ApiService api;

  MainViewsRepoImpl({required this.api});
  @override
  Future<Either<Failure, StartChatSessionModel>> startChatSession(
    StartChatSessionBody startChatSessionBody,
  ) async {
    try {
      var response = await api.post(
        ApiKeys.startChatSession,
        data: startChatSessionBody.toJson(),
      );
      var sessionData = StartChatSessionModel.fromJson(response);
      CacheHelper.setSecureData(
        key: CacheKeys.sessionId,
        value: sessionData.sessionId!,
      );
      return right(sessionData);
    } on Exception catch (e) {
      if (e is DioException) {
        log(
          "Error in MainViewsRepoImpl in startChatSession method in dio exceptions : $e",
        );
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in MainViewsRepoImpl in startChatSession method : $e");
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> endChatSession(String sessionId) async{
    try {
      await api.delete(
        '${ApiKeys.endChatSession}/$sessionId',
      );
      return const Right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        log(
          "Error in MainViewsRepoImpl in endChatSession method in dio exceptions : $e",
        );
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in MainViewsRepoImpl in endChatSession method : $e");
      return left(ServerFailure(e.toString()));
    }
  }
}
