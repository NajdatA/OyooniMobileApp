import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_remote_datasource.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/network/network_info.dart';
import 'package:senior_project/features/splash/data/data_source/splash_local_data_source.dart';
import 'package:senior_project/features/splash/domain/repository/splash_repository.dart';

///
/// The [SplashRepositoryImpl] class extends from [BaseRepositoryImpl] class
/// It declares the interactions between the splash feature and the data sources
/// And handles the exception thrown by the data sources and return the corresponding [Failure] class
///
class SplashRepositoryImpl extends BaseRepositoryImpl
    implements SplashRepository {
  final SplashLocalDataSource splashLocalDataSource;
  final BaseRemoteDataSource remoteDataSource;

  SplashRepositoryImpl({
    @required this.splashLocalDataSource,
    @required this.remoteDataSource,
    @required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: splashLocalDataSource,
          baseRemoteDataSource: remoteDataSource,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, String>> getUser() async {
    final getUser = await splashLocalDataSource.getUser;
    if (getUser != null) {
      if (getUser == "volunteer") {
        final token = await splashLocalDataSource.token;
        print('token in splash is $token');
      }
      return Right(getUser);
    } else {
      return Left(CacheFailure());
    }
  }
}
