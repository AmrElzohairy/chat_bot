import 'package:chat_bot/core/errors/failure.dart';
import 'package:chat_bot/features/auth/data/models/sign_in_body_model.dart';
import 'package:chat_bot/features/auth/data/models/sign_in_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignInModel>> signIn(SignInBodyModel signInBody);

  // Future<Either<Failure, void>> signUp(SignUpBodyModel signUpBody);
}
