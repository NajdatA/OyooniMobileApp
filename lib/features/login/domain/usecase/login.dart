import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/login/domain/entity/tokens_entity.dart';
import 'package:senior_project/features/login/domain/repository/login_repository.dart';

class Login extends UseCase<TokensEntity, LoginParams> {
  final LoginRepository repository;

  Login({required this.repository});

  @override
  Future<Either<Failure, TokensEntity>> call(params) async {
    return await repository.loginUser(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
    email,
    password,
  ];
}
