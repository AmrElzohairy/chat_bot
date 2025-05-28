import 'package:chat_bot/features/main_views/data/repo/main_vews_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_bot/features/main_views/data/models/start_chat_session_model.dart';
import 'package:equatable/equatable.dart';

part 'start_session_state.dart';

class StartSessionCubit extends Cubit<StartSessionState> {
  StartSessionCubit({required this.mainViewsRepo})
    : super(StartSessionInitial());
  final MainViewsRepo mainViewsRepo;

  Future<void> startChatSession() async {
    emit(StartSessionInitial());
    var result = await mainViewsRepo.startChatSession();
    result.fold(
      (failure) => emit(StartSessionFailure(failure.errMessage)),
      (sessionData) => emit(StartSessionSuccess(sessionData)),
    );
  }
}
