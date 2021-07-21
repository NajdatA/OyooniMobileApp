import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_local_data_source.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/exceptions.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/network/network_info.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/available_times/data/datasources/available_times_remote_data_source.dart';
import 'package:senior_project/features/available_times/domain/entities/available_times_entity.dart';
import 'package:senior_project/features/available_times/domain/entities/times_entity.dart';
import 'package:senior_project/features/available_times/domain/repositories/available_times_repository.dart';

class AvailableTimesRepositoryImpl extends BaseRepositoryImpl
    implements AvailableTimesRepository {
  final AvailableTimesRemoteDataSource availableTimesRemoteDataSource;
  final BaseLocalDataSource localDataSource;

  AvailableTimesRepositoryImpl(
      {@required this.availableTimesRemoteDataSource,
        @required this.localDataSource,
        @required NetworkInfo networkInfo})
      : super(
      baseRemoteDataSource: availableTimesRemoteDataSource,
      baseLocalDataSource: localDataSource,
      networkInfo: networkInfo);

  @override
  Future<Either<Failure, AvailableTimesEntity>> getAvailableTimes() {
    return requestWithToken<AvailableTimesEntity>((token) async {
      try {
        final result =
        await availableTimesRemoteDataSource.getAvailableTimes(token);
        print("I got a response");
        // print("HAHAHA token from login is ${result.data.token}");
        if (result == null)
          return Left(ServerFailure(ErrorCode.SERVER_ERROR));
        else {
          return Right(result);
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorCode));
      }
    });
  }

  @override
  Future<Either<Failure, String>> deleteTime(String id) {
    return requestWithToken<String>((token) async {
      try {
        final result =
        await availableTimesRemoteDataSource.deleteTime(token, id);
        print("I got a response");
        // print("HAHAHA token from login is ${result.data.token}");
        if (result == null)
          return Left(ServerFailure(ErrorCode.SERVER_ERROR));
        else {
          return Right(result);
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorCode));
      }
    });
  }

  @override
  Future<Either<Failure, List<TimesEntity>>> addTime(int index, String from, String to) {
    return requestWithToken<List<TimesEntity>>((token) async {
      try {
        final result =
        await availableTimesRemoteDataSource.addTime(token, index, from, to);
        print("I got a response $result");
        // print("HAHAHA token from login is ${result.data.token}");
        if (result == null)
          return Left(ServerFailure(ErrorCode.SERVER_ERROR));
        else {
          return Right(result);
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorCode));
      }
    });
  }
}
