import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/login/domain/repository/login_repository.dart';

class CheckToken extends UseCase<bool, NoParams> {
  final LoginRepository repository;

  CheckToken({required this.repository});

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await repository.checkToken();
  }
}