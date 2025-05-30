part of 'saved_sessions_cubit.dart';

sealed class SavedSessionsState extends Equatable {
  const SavedSessionsState();

  @override
  List<Object> get props => [];
}

final class SavedSessionsInitial extends SavedSessionsState {}

final class SavedSessionsLoading extends SavedSessionsState {}

final class SavedSessionsSuccess extends SavedSessionsState {
  final List<SavedSessionData> savedSessions;

  const SavedSessionsSuccess(this.savedSessions);

  @override
  List<Object> get props => [savedSessions];
}

final class SavedSessionsFailure extends SavedSessionsState {
  final String errMessage;

  const SavedSessionsFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
