import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/sign_up/domain/entity/user.dart';
import 'package:senior_project/features/sign_up/domain/repository/sign_up_repository.dart';

class SignUp extends UseCase<bool, SignUpParams> {
  final SignUpRepository repository;

  SignUp({@required this.repository}) : assert(repository != null);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return await repository.signUpUser(params.email,params.first, params.last, params.password, params.confirmPassword);
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String first;
  final String last;
  final String password;
  final String confirmPassword;

  SignUpParams({
    this.email,
    this.first,
    this.last,
    this.password,
    this.confirmPassword,
  });

  @override
  List<Object> get props => [
    email,
    first,
    last,
    password,
    confirmPassword,
  ];
}
