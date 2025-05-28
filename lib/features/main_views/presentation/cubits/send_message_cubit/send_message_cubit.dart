import 'package:chat_bot/features/main_views/data/models/chat_body_model.dart';
import 'package:chat_bot/features/main_views/data/repo/main_vews_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_bot/features/main_views/data/models/chat_response_model.dart';
import 'package:equatable/equatable.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit({required this.mainViewsRepo}) : super(SendMessageInitial());
  final MainViewsRepo mainViewsRepo;

  Future<void> sendMessage(String sessionId, ChatBodyModel chatBody) async {
    emit(ResponseLoading());
    var result = await mainViewsRepo.sendMessage(sessionId, chatBody);
    result.fold(
      (failure) => emit(SendMessageFailure(failure.errMessage)),
      (chatResponse) => emit(SendMessageSuccess(chatResponse)),
    );
  }
}
