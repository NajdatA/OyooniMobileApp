import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/exceptions.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/network/network_info.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/sign_up/data/datasource/sign_up_local_data_source.dart';
import 'package:senior_project/features/sign_up/data/datasource/sign_up_remote_data_source.dart';
import 'package:senior_project/features/sign_up/domain/entity/user.dart';
import 'package:senior_project/features/sign_up/domain/repository/sign_up_repository.dart';

class SignUpRepositoryImpl extends BaseRepositoryImpl
    implements SignUpRepository {
  final SignUpRemoteDataSource signUpRemoteDataSource;
  final SignUpLocalDataSource signUpLocalDataSource;

  SignUpRepositoryImpl(
      {@required this.signUpRemoteDataSource,
      @required this.signUpLocalDataSource,
      @required NetworkInfo networkInfo})
      : super(
            baseLocalDataSource: signUpLocalDataSource,
            baseRemoteDataSource: signUpRemoteDataSource,
            networkInfo: networkInfo);

  @override
  Future<Either<Failure, bool>> signUpUser(String email, String first,
      String last, String password, String confirmPassword) {
    return checkNetwork(() async {
      try {
        print("hohoho $first $last");
        final result =
            await signUpRemoteDataSource.signUpUser(email, first, last, password, confirmPassword);
        print("error is");
        print("error is ${result.errors}");
        if (result == null || result.data == null)
          return Left(ServerFailure(ErrorCode.SERVER_ERROR));
        else if (result.errors != null) {
          return Left(ServerFailure(ErrorCode.WRONG_INPUT));
        }
        else {
          print("NNNNNNNNNNN");
          await signUpLocalDataSource.signUpUser(
            // result.data,
            result.data.token,
            result.data.refreshToken,
          );
          return Right(true);
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorCode));
      }
    });
  }
}
