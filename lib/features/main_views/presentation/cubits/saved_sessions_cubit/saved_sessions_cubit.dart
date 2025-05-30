import 'package:chat_bot/features/main_views/data/models/saved_sesions_model.dart';
import 'package:chat_bot/features/main_views/data/repo/main_vews_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_sessions_state.dart';

class SavedSessionsCubit extends Cubit<SavedSessionsState> {
  SavedSessionsCubit({required this.mainViewsRepo})
    : super(SavedSessionsInitial());
  final MainViewsRepo mainViewsRepo;
  Future<void> getSavedSessions() async {
    emit(SavedSessionsLoading());
    var result = await mainViewsRepo.getSavedSessions();
    result.fold(
      (failure) => emit(SavedSessionsFailure(failure.errMessage)),
      (savedSessions) => emit(SavedSessionsSuccess(savedSessions)),
    );
  }
}
