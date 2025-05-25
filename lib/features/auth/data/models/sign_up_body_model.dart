import 'package:equatable/equatable.dart';

class SignUpBodyModel extends Equatable {
  final String? fullName;
  final String? userName;
  final String? email;
  final String? password;

  const SignUpBodyModel({
    this.fullName,
    this.userName,
    this.email,
    this.password,
  });

  factory SignUpBodyModel.fromJson(Map<String, dynamic> json) {
    return SignUpBodyModel(
      fullName: json['fullName'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'fullName': fullName,
    'userName': userName,
    'email': email,
    'password': password,
  };

  @override
  List<Object?> get props => [fullName, userName, email, password];
}
