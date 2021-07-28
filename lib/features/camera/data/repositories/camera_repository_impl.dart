import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_local_data_source.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/exceptions.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/network/network_info.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/camera/data/datasources/camera_remote_data_source.dart';
import 'package:senior_project/features/camera/domain/repositories/camera_repository.dart';
import 'package:senior_project/features/login/data/datasource/login_local_data_source.dart';
import 'package:senior_project/features/login/data/datasource/login_remote_data_source.dart';
import 'package:senior_project/features/login/data/model/tokens_model.dart';

class CameraRepositoryImpl extends BaseRepositoryImpl
    implements CameraRepository {
  final CameraRemoteDataSource cameraRemoteDataSource;
  final BaseLocalDataSource baseLocalDataSource;

  CameraRepositoryImpl(
      {required this.cameraRemoteDataSource,
        required this.baseLocalDataSource,
        required NetworkInfo networkInfo})
      : super(
      baseRemoteDataSource: cameraRemoteDataSource,
      baseLocalDataSource: baseLocalDataSource,
      networkInfo: networkInfo);

  @override
  Future<Either<Failure, String>> textRecognition(String image) {
    return checkNetwork(() async {
      try {
        final result =
        await cameraRemoteDataSource.textRecognition(image);
        if (result == null || result.data == null)
          return Left(ServerFailure(ErrorCode.SERVER_ERROR));
        else {
          return Right(result.data!);
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorCode));
      }
    });
  }

  @override
  Future<Either<Failure, String>> imageCaptioning(String image) {
    return checkNetwork(() async {
      try {
        final result =
        await cameraRemoteDataSource.imageCaptioning(image);
        if (result == null || result.data == null)
          return Left(ServerFailure(ErrorCode.SERVER_ERROR));
        else {
          return Right(result.data!.caption);
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorCode));
      }
    });
  }

  @override
  Future<Either<Failure, int>> banknoteRecognition(String image) {
    return checkNetwork(() async {
      try {
        final result =
        await cameraRemoteDataSource.banknoteRecognition(image);
        if (result == null || result.data == null)
          return Left(ServerFailure(ErrorCode.SERVER_ERROR));
        else {
          return Right(result.data!.bankNoteType);
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorCode));
      }
    });
  }

  @override
  Future<Either<Failure, int>> colorRecognition(String image) {
    return checkNetwork(() async {
      try {
        final result =
        await cameraRemoteDataSource.colorRecognition(image);
        if (result == null || result.data == null)
          return Left(ServerFailure(ErrorCode.SERVER_ERROR));
        else {
          return Right(result.data!.recognizedColor);
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorCode));
      }
    });
  }
}
