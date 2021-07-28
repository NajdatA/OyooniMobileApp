import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_remote_datasource.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/network/network_info.dart';
import 'package:senior_project/features/choose_user/data/data_source/choose_user_local_data_source.dart';
import 'package:senior_project/features/choose_user/domain/repository/choose_user_repository.dart';

class ChooseUserRepositoryImpl extends BaseRepositoryImpl
    implements ChooseUserRepository {
  final ChooseUserLocalDataSource chooseUserLocalDataSource;
  final BaseRemoteDataSource remoteDataSource;

  ChooseUserRepositoryImpl({
    required this.chooseUserLocalDataSource,
    required this.remoteDataSource,
    required NetworkInfo networkInfo,
  }) : super(
          baseLocalDataSource: chooseUserLocalDataSource,
          baseRemoteDataSource: remoteDataSource,
          networkInfo: networkInfo,
        );

  @override
  Future<Either<Failure, String>> chooseUser(String user) async {
    final getUser = await chooseUserLocalDataSource.chooseUser(user);
    if (getUser != null) {
      return Right(getUser);
    } else {
      return Left(CacheFailure());
    }
  }
}
