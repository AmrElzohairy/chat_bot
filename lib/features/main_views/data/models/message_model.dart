import 'package:equatable/equatable.dart';

enum MessageType { user, bot }

class MessageModel extends Equatable {
  final String id;
  final String content;
  final MessageType type;
  final DateTime timestamp;
  final bool isLoading;

  const MessageModel({
    required this.id,
    required this.content,
    required this.type,
    required this.timestamp,
    this.isLoading = false,
  });

  factory MessageModel.user({
    required String content,
    String? id,
  }) {
    return MessageModel(
      id: id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      type: MessageType.user,
      timestamp: DateTime.now(),
    );
  }

  factory MessageModel.bot({
    required String content,
    String? id,
  }) {
    return MessageModel(
      id: id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      type: MessageType.bot,
      timestamp: DateTime.now(),
    );
  }

  factory MessageModel.loading({
    String? id,
  }) {
    return MessageModel(
      id: id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      content: '',
      type: MessageType.bot,
      timestamp: DateTime.now(),
      isLoading: true,
    );
  }

  MessageModel copyWith({
    String? id,
    String? content,
    MessageType? type,
    DateTime? timestamp,
    bool? isLoading,
  }) {
    return MessageModel(
      id: id ?? this.id,
      content: content ?? this.content,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [id, content, type, timestamp, isLoading];
}
