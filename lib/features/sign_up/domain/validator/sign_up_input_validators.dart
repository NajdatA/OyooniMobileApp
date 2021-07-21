import 'package:dartz/dartz.dart';
import 'package:senior_project/core/error/failures.dart';

class SignUpInputValidators {
  RegExp emailRegExp =RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  Either<Failure, String> validateEmailInput(String email) {
    if (emailRegExp.hasMatch(email)) {
      return Right(email);
    } else
      return Left(InvalidInputFailure());
  }

  Either<Failure, String> validatePasswordInput(String password) {
    if (password.length > 7)
      return Right(password);
    else
      return Left(InvalidInputFailure());
  }
}

class InvalidInputFailure extends Failure {}
