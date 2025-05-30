import 'dart:developer';

import 'package:chat_bot/core/cache/cache_constants.dart';
import 'package:chat_bot/core/cache/cache_helper.dart';
import 'package:chat_bot/core/errors/failure.dart';
import 'package:chat_bot/core/networking/api_keys.dart';
import 'package:chat_bot/core/networking/api_services.dart';
import 'package:chat_bot/features/main_views/data/models/chat_body_model.dart';
import 'package:chat_bot/features/main_views/data/models/chat_response_model.dart';
import 'package:chat_bot/features/main_views/data/models/start_chat_session_model.dart';
import 'package:chat_bot/features/main_views/data/repo/main_vews_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MainViewsRepoImpl extends MainViewsRepo {
  final ApiService api;

  MainViewsRepoImpl({required this.api});
  @override
  Future<Either<Failure, StartChatSessionModel>> startChatSession() async {
    try {
      var response = await api.post(ApiKeys.startChatSession);
      var sessionData = StartChatSessionModel.fromJson(response);
      CacheHelper.set(key: CacheKeys.sessionId, value: sessionData.sessionId!);
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
  Future<Either<Failure, void>> endChatSession(String sessionId) async {
    try {
      await api.delete('${ApiKeys.endChatSession}/$sessionId');
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

  @override
  Future<Either<Failure, ChatResponseModel>> sendMessage(
    String sessionId,
    ChatBodyModel chatBody,
  ) async {
    try {
      var response = await api.post(
        '${ApiKeys.sendMessage}/$sessionId',
        data: chatBody.toJson(),
      );
      var chatResponse = ChatResponseModel.fromJson(response);
      return right(chatResponse);
    } on Exception catch (e) {
      if (e is DioException) {
        log(
          "Error in MainViewsRepoImpl in sendMessage method in dio exceptions : $e",
        );
        return left(ServerFailure.fromDioExeptions(e));
      }
      log("Error in MainViewsRepoImpl in sendMessage method : $e");
      return left(ServerFailure(e.toString()));
    }
  }
}
