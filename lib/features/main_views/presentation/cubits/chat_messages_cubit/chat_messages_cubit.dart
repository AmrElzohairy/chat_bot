import 'dart:developer';

import 'package:chat_bot/features/main_views/data/models/message_model.dart';
import 'package:chat_bot/features/main_views/data/models/chat_response_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_messages_state.dart';

class ChatMessagesCubit extends Cubit<ChatMessagesState> {
  ChatMessagesCubit() : super(const ChatMessagesState());

  void addUserMessage(String content) {
    log('💬 Adding user message: $content');
    
    final userMessage = MessageModel.user(content: content);
    final loadingMessage = MessageModel.loading();
    
    final updatedMessages = List<MessageModel>.from(state.messages)
      ..add(userMessage)
      ..add(loadingMessage);

    emit(state.copyWith(
      messages: updatedMessages,
      isLoading: true,
    ));
  }

  void addBotResponse(ChatResponseModel response) {
    log('🤖 Adding bot response');
    
    final messages = List<MessageModel>.from(state.messages);
    
    // Remove the loading message (last message should be loading)
    if (messages.isNotEmpty && messages.last.isLoading) {
      messages.removeLast();
    }

    // Add bot response
    if (response.aiResponse != null && response.aiResponse!.isNotEmpty) {
      final botMessage = MessageModel.bot(content: response.aiResponse!);
      messages.add(botMessage);
      log('✅ Bot response added: ${response.aiResponse}');
    }

    emit(state.copyWith(
      messages: messages,
      isLoading: false,
    ));
  }

  void handleMessageError(String error) {
    log('❌ Message error: $error');
    
    final messages = List<MessageModel>.from(state.messages);
    
    // Remove the loading message
    if (messages.isNotEmpty && messages.last.isLoading) {
      messages.removeLast();
    }

    // Add error message
    final errorMessage = MessageModel.bot(
      content: 'Sorry, I encountered an error. Please try again.',
    );
    messages.add(errorMessage);

    emit(state.copyWith(
      messages: messages,
      isLoading: false,
      error: error,
    ));
  }

  void clearMessages() {
    log('🗑️ Clearing all messages');
    emit(const ChatMessagesState());
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }
}
