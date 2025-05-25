import 'package:equatable/equatable.dart';

class SignInBodyModel extends Equatable {
  final String? email;
  final String? password;

  const SignInBodyModel({this.email, this.password});

  factory SignInBodyModel.fromJson(Map<String, dynamic> json) {
    return SignInBodyModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  @override
  List<Object?> get props => [email, password];
}
