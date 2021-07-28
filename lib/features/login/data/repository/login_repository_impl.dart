import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/exceptions.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/network/network_info.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/login/data/datasource/login_local_data_source.dart';
import 'package:senior_project/features/login/data/datasource/login_remote_data_source.dart';
import 'package:senior_project/features/login/data/model/tokens_model.dart';
import 'package:senior_project/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends BaseRepositoryImpl
    implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;

  LoginRepositoryImpl(
      {required this.loginRemoteDataSource,
      required this.loginLocalDataSource,
      required NetworkInfo networkInfo})
      : super(
            baseRemoteDataSource: loginRemoteDataSource,
            baseLocalDataSource: loginLocalDataSource,
            networkInfo: networkInfo);

  @override
  Future<Either<Failure, TokensModel>> loginUser(String email, String password) {
    print("jajajaj");
    return checkNetwork(() async {
      try {
        final result =
            await loginRemoteDataSource.loginUser(email, password);
        // print("HAHAHA token from login is ${result.data.token}");
        if (result == null || result.data == null)
          return Left(ServerFailure(ErrorCode.SERVER_ERROR));
        else {
          print("token is ${result.data!.token}");
          loginLocalDataSource.updateToken(result.data!.token, result.data!.refreshToken);
          return Right(result.data!);
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorCode));
      }
    });
  }

  @override
  Future<Either<Failure, bool>> checkToken() async {
    try {
      final token = await loginLocalDataSource.token;
      if (token == "" || token == null)
        return Right(false);
      return Right(true);
    } catch (e) {
      print("e is $e");
      return Left(CacheFailure());
    }
  }
}
