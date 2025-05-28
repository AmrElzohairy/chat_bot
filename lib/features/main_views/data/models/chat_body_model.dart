import 'package:equatable/equatable.dart';

class ChatBodyModel extends Equatable {
  final String? message;

  const ChatBodyModel({this.message});

  factory ChatBodyModel.fromJson(Map<String, dynamic> json) =>
      ChatBodyModel(message: json['message'] as String?);

  Map<String, dynamic> toJson() => {'message': message};

  @override
  List<Object?> get props => [message];
}
