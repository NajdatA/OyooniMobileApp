import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/signalr_connection/domain/repositories/signalr_connection_repository.dart';

class GetToken extends UseCase<String, NoParams> {
  final SignalRConnectionRepository repository;

  GetToken({@required this.repository}) : assert(repository != null);

  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.getToken();
  }
}