import 'package:equatable/equatable.dart';

class StartChatSessionBody extends Equatable {
  final String? botId;

  const StartChatSessionBody({this.botId});

  factory StartChatSessionBody.fromJson(Map<String, dynamic> json) {
    return StartChatSessionBody(botId: json['botId'] as String?);
  }

  Map<String, dynamic> toJson() => {'botId': botId};

  @override
  List<Object?> get props => [botId];
}
