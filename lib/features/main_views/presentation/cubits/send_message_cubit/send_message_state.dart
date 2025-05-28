part of 'send_message_cubit.dart';

sealed class SendMessageState extends Equatable {
  const SendMessageState();

  @override
  List<Object> get props => [];
}

final class SendMessageInitial extends SendMessageState {}

final class SendMessageSuccess extends SendMessageState {
  final ChatResponseModel chatResponse;

  const SendMessageSuccess(this.chatResponse);

  @override
  List<Object> get props => [chatResponse];
}

final class SendMessageFailure extends SendMessageState {
  final String errMessage;

  const SendMessageFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

final class ResponseLoading extends SendMessageState {}
