import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/splash/domain/repository/splash_repository.dart';

///
/// The [GetLanguage] is responsible for communicating with the [SplashRepository] interface
///
/// Returns:
///   - Right of language chosen if the user has already chosen a language earlier
///   - Right of empty String if the user is not logged in
///   - Left of [Failure] if there was an error retrieving the String
///
///
class GetUser extends UseCase<String, NoParams> {
  final SplashRepository repository;

  GetUser({@required this.repository}) : assert(repository != null);

  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.getUser();
  }
}