part of 'chat_messages_cubit.dart';

class ChatMessagesState extends Equatable {
  final List<MessageModel> messages;
  final bool isLoading;
  final String? error;

  const ChatMessagesState({
    this.messages = const [],
    this.isLoading = false,
    this.error,
  });

  ChatMessagesState copyWith({
    List<MessageModel>? messages,
    bool? isLoading,
    String? error,
  }) {
    return ChatMessagesState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [messages, isLoading, error];
}
