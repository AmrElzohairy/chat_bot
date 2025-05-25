part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final SignInModel user;

  const SignInSuccess(this.user);

  @override
  List<Object> get props => [user];
}

final class SignInFailure extends SignInState {
  final String errMessage;

  const SignInFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
