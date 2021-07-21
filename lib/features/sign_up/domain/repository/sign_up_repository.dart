import 'package:dartz/dartz.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/features/sign_up/domain/entity/user.dart';

abstract class SignUpRepository extends BaseRepository {
  Future<Either<Failure, bool>> signUpUser(String email, String first,
      String last, String password, String confirmPassword);
}
