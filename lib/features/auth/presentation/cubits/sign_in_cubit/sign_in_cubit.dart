
import 'package:chat_bot/features/auth/data/models/sign_in_body_model.dart';
import 'package:chat_bot/features/auth/data/models/sign_in_model.dart';
import 'package:chat_bot/features/auth/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signIn(SignInBodyModel signInBody) async {
    emit(SignInLoading());
    var result = await authRepo.signIn(signInBody);
    result.fold(
      (failure) => emit(SignInFailure(failure.errMessage)),
      (user) => emit(SignInSuccess(user)),
    );
  }
}
