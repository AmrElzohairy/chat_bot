import 'package:equatable/equatable.dart';

class StartChatSessionModel extends Equatable {
  final dynamic message;
  final String? sessionId;
  final String? sessionTitle;
  final dynamic endedAt;
  final String? userId;
  final String? botId;

  const StartChatSessionModel({
    this.message,
    this.sessionId,
    this.sessionTitle,
    this.endedAt,
    this.userId,
    this.botId,
  });

  factory StartChatSessionModel.fromJson(Map<String, dynamic> json) {
    return StartChatSessionModel(
      message: json['message'] as dynamic,
      sessionId: json['sessionId'] as String?,
      sessionTitle: json['sessionTitle'] as String?,
      endedAt: json['endedAt'] as dynamic,
      userId: json['userId'] as String?,
      botId: json['botId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'sessionId': sessionId,
    'sessionTitle': sessionTitle,
    'endedAt': endedAt,
    'userId': userId,
    'botId': botId,
  };

  @override
  List<Object?> get props {
    return [message, sessionId, sessionTitle, endedAt, userId, botId];
  }
}
