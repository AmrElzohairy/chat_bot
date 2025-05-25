import 'package:equatable/equatable.dart';

class SignInModel extends Equatable {
  final dynamic message;
  final String? authProvider;
  final List<String>? roles;
  final bool? isAuthenticated;
  final String? token;
  final String? refreshToken;
  final DateTime? refreshTokenExpiration;
  final String? userId;
  final String? email;
  final String? name;
  final String? userName;
  final dynamic phone;
  final String? profilePicture;

  const SignInModel({
    this.message,
    this.authProvider,
    this.roles,
    this.isAuthenticated,
    this.token,
    this.refreshToken,
    this.refreshTokenExpiration,
    this.userId,
    this.email,
    this.name,
    this.userName,
    this.phone,
    this.profilePicture,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    message: json['message'] as dynamic,
    authProvider: json['authProvider'] as String?,
    roles: json['roles'] as List<String>?,
    isAuthenticated: json['isAuthenticated'] as bool?,
    token: json['token'] as String?,
    refreshToken: json['refreshToken'] as String?,
    refreshTokenExpiration:
        json['refreshTokenExpiration'] == null
            ? null
            : DateTime.parse(json['refreshTokenExpiration'] as String),
    userId: json['userId'] as String?,
    email: json['email'] as String?,
    name: json['name'] as String?,
    userName: json['userName'] as String?,
    phone: json['phone'] as dynamic,
    profilePicture: json['profilePicture'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'authProvider': authProvider,
    'roles': roles,
    'isAuthenticated': isAuthenticated,
    'token': token,
    'refreshToken': refreshToken,
    'refreshTokenExpiration': refreshTokenExpiration?.toIso8601String(),
    'userId': userId,
    'email': email,
    'name': name,
    'userName': userName,
    'phone': phone,
    'profilePicture': profilePicture,
  };

  @override
  List<Object?> get props {
    return [
      message,
      authProvider,
      roles,
      isAuthenticated,
      token,
      refreshToken,
      refreshTokenExpiration,
      userId,
      email,
      name,
      userName,
      phone,
      profilePicture,
    ];
  }
}
