import 'package:dartz/dartz.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/failures.dart';

abstract class CameraRepository extends BaseRepository {
  Future<Either<Failure, String>> textRecognition(String image);
  Future<Either<Failure, String>> imageCaptioning(String image);
  Future<Either<Failure, int>> banknoteRecognition(String image);
  Future<Either<Failure, int>> colorRecognition(String image);
}
