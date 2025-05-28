import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_bot/features/main_views/data/models/chat_response_model.dart';
import 'package:equatable/equatable.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(SendMessageInitial());
}
