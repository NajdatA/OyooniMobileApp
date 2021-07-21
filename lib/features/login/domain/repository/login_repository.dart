import 'package:dartz/dartz.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/features/login/domain/entity/tokens_entity.dart';
abstract class LoginRepository extends BaseRepository {
  Future<Either<Failure, TokensEntity>> loginUser(String email, String password);
  Future<Either<Failure, bool>> checkToken();
}
