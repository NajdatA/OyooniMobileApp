import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SignalRConnectionRepository extends BaseRepository {
  Future<Either<Failure, String>> getToken();
}