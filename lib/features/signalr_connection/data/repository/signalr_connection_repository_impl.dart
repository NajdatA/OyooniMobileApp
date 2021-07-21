import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_local_data_source.dart';
import 'package:senior_project/core/data/model/base_remote_datasource.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/network/network_info.dart';
import 'package:senior_project/features/signalr_connection/domain/repositories/signalr_connection_repository.dart';
import 'package:senior_project/features/splash/data/data_source/splash_local_data_source.dart';

class SignalRConnectionRepositoryImpl extends BaseRepositoryImpl
    implements SignalRConnectionRepository {
  final BaseLocalDataSource localDataSource;
  final BaseRemoteDataSource remoteDataSource;

  SignalRConnectionRepositoryImpl({
    @required this.localDataSource,
    @required this.remoteDataSource,
    @required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: localDataSource,
          baseRemoteDataSource: remoteDataSource,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, String>> getToken() async {
    final getToken = await localDataSource.token;
    if (getToken != null) {
      return Right(getToken);
    } else {
      return Left(CacheFailure());
    }
  }
}
