import 'package:chat_bot/core/errors/failure.dart';
import 'package:chat_bot/features/main_views/data/models/chat_body_model.dart';
import 'package:chat_bot/features/main_views/data/models/chat_response_model.dart';
import 'package:chat_bot/features/main_views/data/models/start_chat_session_model.dart';
import 'package:dartz/dartz.dart';

abstract class MainViewsRepo {
  Future<Either<Failure, StartChatSessionModel>> startChatSession();
  Future<Either<Failure, void>> endChatSession(String sessionId);
  Future<Either<Failure, ChatResponseModel>> sendMessage(
    String sessionId,
    ChatBodyModel chatBody,
  );
}
