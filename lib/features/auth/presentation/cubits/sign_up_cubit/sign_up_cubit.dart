import 'package:chat_bot/features/auth/data/models/sign_up_body_model.dart';
import 'package:chat_bot/features/auth/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit({required this.authRepo}) : super(SignUpCubitInitial());

  Future<void> signUp(SignUpBodyModel signUpBody) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(signUpBody);
    result.fold(
      (failure) => emit(SignUpFailure(failure.errMessage)),
      (success) => emit(const SignUpSuccess()),
    );
  }
}
