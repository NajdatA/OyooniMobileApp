import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/choose_user/domain/repository/choose_user_repository.dart';

class ChooseUser extends UseCase<String, ChooseUserParams> {
  final ChooseUserRepository repository;

  ChooseUser({required this.repository});

  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.chooseUser(params.user);
  }
}

class ChooseUserParams extends Equatable {
  final String user;

  ChooseUserParams(this.user);

  @override
  List<Object> get props => [user];
}