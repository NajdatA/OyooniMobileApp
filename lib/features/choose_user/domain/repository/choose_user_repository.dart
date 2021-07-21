import 'package:dartz/dartz.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/failures.dart';

abstract class ChooseUserRepository extends BaseRepository {
  Future<Either<Failure, String>> chooseUser(String language);
}
