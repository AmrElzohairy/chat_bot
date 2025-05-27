import 'package:equatable/equatable.dart';

class StartChatSessionBody extends Equatable {
  final String? userId;
  final String? botId;
  final String? sessionTitle;

  const StartChatSessionBody({this.userId, this.botId, this.sessionTitle});

  factory StartChatSessionBody.fromJson(Map<String, dynamic> json) {
    return StartChatSessionBody(
      userId: json['userId'] as String?,
      botId: json['botId'] as String?,
      sessionTitle: json['sessionTitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'botId': botId,
    'sessionTitle': sessionTitle,
  };

  @override
  List<Object?> get props => [userId, botId, sessionTitle];
}
