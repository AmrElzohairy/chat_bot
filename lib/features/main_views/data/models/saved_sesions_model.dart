// Message model for user and bot messages
class Message {
  final String messageContent;
  final DateTime sentAt;

  Message({required this.messageContent, required this.sentAt});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageContent: json['messageContent'] ?? '',
      sentAt: DateTime.parse(json['sentAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageContent': messageContent,
      'sentAt': sentAt.toIso8601String(),
    };
  }
}

// Chat session item model
class SavedSessionData {
  final String sessionId;
  final String userId;
  final String userName;
  final String botId;
  final String botName;
  final List<Message> userMessages;
  final List<Message> botMessages;
  final DateTime startedAt;
  final DateTime? endedAt;
  final bool isActive;

  SavedSessionData({
    required this.sessionId,
    required this.userId,
    required this.userName,
    required this.botId,
    required this.botName,
    required this.userMessages,
    required this.botMessages,
    required this.startedAt,
    this.endedAt,
    required this.isActive,
  });

  factory SavedSessionData.fromJson(Map<String, dynamic> json) {
    return SavedSessionData(
      sessionId: json['sessionId'] ?? '',
      userId: json['userId'] ?? '',
      userName: json['userName'] ?? '',
      botId: json['botId'] ?? '',
      botName: json['botName'] ?? '',
      userMessages:
          (json['userMessages'] as List<dynamic>?)
              ?.map((messageJson) => Message.fromJson(messageJson))
              .toList() ??
          [],
      botMessages:
          (json['botMessages'] as List<dynamic>?)
              ?.map((messageJson) => Message.fromJson(messageJson))
              .toList() ??
          [],
      startedAt: DateTime.parse(json['startedAt']),
      endedAt: json['endedAt'] != null ? DateTime.parse(json['endedAt']) : null,
      isActive: json['isActive'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      'userId': userId,
      'userName': userName,
      'botId': botId,
      'botName': botName,
      'userMessages': userMessages.map((message) => message.toJson()).toList(),
      'botMessages': botMessages.map((message) => message.toJson()).toList(),
      'startedAt': startedAt.toIso8601String(),
      'endedAt': endedAt?.toIso8601String(),
      'isActive': isActive,
    };
  }

  map(Function(dynamic e) param0) {}
}

// Main response model
