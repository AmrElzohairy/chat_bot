import 'package:equatable/equatable.dart';

class ChatResponseModel extends Equatable {
  final dynamic message;
  final String? userMessage;
  final String? aiResponse;

  const ChatResponseModel({this.message, this.userMessage, this.aiResponse});

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      message: json['message'] as dynamic,
      userMessage: json['userMessage'] as String?,
      aiResponse: json['aiResponse'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'userMessage': userMessage,
    'aiResponse': aiResponse,
  };

  @override
  List<Object?> get props => [message, userMessage, aiResponse];
}
