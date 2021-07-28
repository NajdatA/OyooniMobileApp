import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_local_data_source.dart';
import 'package:senior_project/core/error/exceptions.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/network/network_info.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/core/data/model/base_remote_datasource.dart';
// import 'package:senior_project/feature/verfity/data/model/user_model.dart';
// import 'package:senior_project/feature/verfity/domain/entity/user.dart';

typedef FutureEitherOr<T> = Future<Either<Failure, T>> Function();
typedef FutureEitherOrWithToken<T> = Future<Either<Failure, T>> Function(
  String token,
);

///
///
/// The [BaseRepository] interface declares the basic and shared interaction between the domain layer and the data layer.
///
/// All the getters and functions in this class returns a [Future] of [Either] a [T] OR [Failure]
///
/// Each repository interface must extend from this interface
///
///
abstract class BaseRepository {
  ///
  /// This function checks if the device is connected to the network
  /// uses [NetworkInfo] interface to check if it's connected or not
  ///
  ///
  /// Params:
  ///   [body] which is a function that has the same return type of the [checkNetwork] function,
  ///   it's triggered when the connection result was retrieved
  ///
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [T]
  ///   return cases:
  ///     a- [ServerFailure] with [ErrorCode.NO_INTERNET_CONNECTION] if there was no Internet connection
  ///     b- Returns the value returned by the [body] function
  ///
  ///
  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body);

  ///
  ///
  /// This function retrieves the user's token from the local data source
  ///
  ///
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [String]
  ///   return cases:
  ///     a- [Failure] if the token was null or empty
  ///     b- [String] which is the token value if it was successfully retrieved
  ///
  ///
  Future<Either<Failure, String>> getToken();

  ///
  ///
  /// This function retrieves the user's token from the local data source
  ///
  ///
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [AppLanguage]
  ///   return cases:
  ///     a- [Failure] if the token was null or empty
  ///     b- [AppLanguage] which is the current language
  ///
  ///

  ///
  ///
  /// This function retrieves the user's refresh token from the local data source
  ///
  ///
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [String]
  ///   return cases:
  ///     a- [Failure] if the token was null or empty
  ///     b- [String] which is the token value if it was successfully retrieved
  ///
  ///
  Future<Either<Failure, String>> getRefreshToken();

  ///
  /// This function is used to refresh the current user session
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [void]
  ///
  // Future<Either<Failure, void>> refreshSession();

  ///
  /// This function is used to delete user cached data and log him out of the app
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [void]
  ///
  Future<Either<Failure, void>> logOutUser();

  // Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, AppLanguage>> getAppLanguage();
  // Future<Either<Failure, bool>> getIosState();

  ///
  ///
  /// This function retrieves the user's token from the local data source
  ///
  ///
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [bool]
  ///   return cases:
  ///     a- [Failure] if the token was null or empty
  ///     b- [bool] which is the value if it's changed correctly or not
  ///
  ///
  Future<Either<Failure, bool>> setAppLanguage(AppLanguage language);

  ///
  ///
  /// This function is a wrapper that uses both [getToken] and [checkNetwork] functions
  ///
  ///
  /// Params:
  ///   [body] which is a function that has the same return type of the [requestWithToken] function and passes the token in its params,
  ///   it's triggered after these steps:
  ///     1- After checking the connection of the device using [checkNetwork], if it was connected you go to step two
  ///        if not it returns the value from the [checkNetwork] function immediately.
  ///
  ///     2- Gets the token using [getToken], if it was successfully retrieved, the [body] function gets triggered
  ///        with the token, if not, a cache failure gets returned
  ///
  /// Returns:
  /// [Future] of [Either] a [Failure] OR [String]
  ///
  Future<Either<Failure, T>> requestWithToken<T>(
      FutureEitherOrWithToken<T> body);
}

/// [BaseRepositoryImpl] is the implementation of the [BaseRepository] interface
/// each repository must extend this class and implement a sub-interface of [BaseRepository] interface.
class BaseRepositoryImpl implements BaseRepository {
  final BaseLocalDataSource baseLocalDataSource;
  final NetworkInfo networkInfo;
  final BaseRemoteDataSource baseRemoteDataSource;

  BaseRepositoryImpl(
      {required this.baseLocalDataSource,
      required this.networkInfo,
      required this.baseRemoteDataSource});

  @override
  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body) async {
    if (await networkInfo.isConnected) {
      return body();
    } else {
      return Left(ServerFailure(ErrorCode.NO_INTERNET_CONNECTION));
    }
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    final token = await baseLocalDataSource.token;
    print(token);
    if (token != null && token.isNotEmpty) {
      return Right(token);
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, AppLanguage>> getAppLanguage() async {
    final appLanguage = await baseLocalDataSource.appLanguage;
    print(appLanguage);
    if (appLanguage != null) {
      return Right(appLanguage);
    } else {
      return Right(AppLanguage.EN);
    }
  }

  @override
  Future<Either<Failure, bool>> setAppLanguage(AppLanguage language) async {
    final appLanguage = await baseLocalDataSource.setAppLanguage(language);
    if (appLanguage != null) {
      return Right(true);
    } else {
      return Right(true);
    }
  }

  @override
  Future<Either<Failure, T>> requestWithToken<T>(
    FutureEitherOrWithToken<T> body,
  ) async {
    // return await checkNetwork<T>(() async {
      // try {
// final t = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCIsImlhdCI6MTYyMDQzOTQ3NywiZXhwIjoxNjIwNjk4Njc3fQ.27IIl16LvRy3WX6-xEKIbeeuebfJ-4q81IBQdNiH-74';
// return body(t);

        final token = await getToken();
        print('token is $token');
        return await token.fold(
          (failure) => body(''),
          (token) async {
            return body(token);
          },
        );
      // } catch (e) {
      //   print('caught from request with token ');
      //   if (e is ServerException) {
      //     if (e.errorCode == ErrorCode.UNAUTHENTICATED) {
      //       print('token expired ');
      //       final result = await refreshSession();
      //       if (result.isLeft()) {
      //         print('is left');
      //         return Left(ServerFailure(ErrorCode.UNAUTHENTICATED));
      //       } else {
      //         print('retrying');
      //         try {
      //           return await body(await baseLocalDataSource.token);
      //         } catch (e) {
      //           print('exception from retry');
      //           return Left(ServerFailure(ErrorCode.UNAUTHENTICATED));
      //         }
      //       }
      //     }
      //     return Left(ServerFailure(e.errorCode));
      //   } else
      //     return Left(ServerFailure(ErrorCode.TIMEOUT));
      // }
    // });
  }

  @override
  Future<Either<Failure, String>> getRefreshToken() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> logOutUser() async {
    await baseLocalDataSource.logOutUser();
    return Future.value(Right(true));
  }

  // @override
  // Future<Either<Failure, User>> getCurrentUser() async {
  //   final user = await baseLocalDataSource.user;
  //   if (user != null && user.isNotEmpty) {
  //     return Right(UserModel.fromJson(json.decode(user)));
  //   } else
  //     return Left(CacheFailure());
  // }

  // @override
  // Future<Either<Failure, bool>> getIosState() async{
  //   return await checkNetwork(
  //         () async {
  //       try {
  //         final result = await baseRemoteDataSource.performGetRequest<IosStateModel>('param');
  //         return result == null
  //             ? Left(ServerFailure(ErrorCode.SERVER_ERROR))
  //             : Right(result.isLive);
  //       } on ServerException catch (e) {
  //         return Left(ServerFailure(e.errorCode));
  //       }
  //     },
  //   );
  // }
}
