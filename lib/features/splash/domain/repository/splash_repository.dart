import 'package:dartz/dartz.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/failures.dart';

///
/// The [SplashRepository] interface extends from [BaseRepository] interface
/// It declares the interactions between the splash feature and the data sources
///
abstract class SplashRepository extends BaseRepository {
  Future<Either<Failure, String>> getUser();
}
