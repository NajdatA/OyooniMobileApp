import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/features/login/domain/entity/tokens_entity.dart';
abstract class CameraRepository extends BaseRepository {
  Future<Either<Failure, String>> textRecognition(File image);
  Future<Either<Failure, String>> imageCaptioning(File image);
  Future<Either<Failure, int>> banknoteRecognition(File image);
}
