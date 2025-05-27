part of 'start_session_cubit.dart';

sealed class StartSessionState extends Equatable {
  const StartSessionState();

  @override
  List<Object> get props => [];
}

final class StartSessionInitial extends StartSessionState {}

final class StartSessionSuccess extends StartSessionState {
  final StartChatSessionModel sessionData;

  const StartSessionSuccess(this.sessionData);

  @override
  List<Object> get props => [sessionData];
}

final class StartSessionFailure extends StartSessionState {
  final String errMessage;

  const StartSessionFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
