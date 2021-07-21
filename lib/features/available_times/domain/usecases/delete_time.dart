import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/available_times/domain/entities/available_times_entity.dart';
import 'package:senior_project/features/available_times/domain/repositories/available_times_repository.dart';
import 'package:senior_project/features/login/domain/repository/login_repository.dart';

class DeleteTime extends UseCase<String, DeleteTimeParams> {
  final AvailableTimesRepository repository;

  DeleteTime({@required this.repository}) : assert(repository != null);

  @override
  Future<Either<Failure, String>> call(params) async {
    return await repository.deleteTime(params.id);
  }
}

class DeleteTimeParams extends Equatable {
  final String id;

  DeleteTimeParams(this.id);

  @override
  List<Object> get props => [id];
}