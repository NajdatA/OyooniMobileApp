import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/available_times/domain/entities/available_times_entity.dart';
import 'package:senior_project/features/available_times/domain/entities/times_entity.dart';
import 'package:senior_project/features/available_times/domain/repositories/available_times_repository.dart';
import 'package:senior_project/features/login/domain/repository/login_repository.dart';

class AddTime extends UseCase<List<TimesEntity?>?, AddTimeParams> {
  final AvailableTimesRepository repository;

  AddTime({required this.repository});

  @override
  Future<Either<Failure, List<TimesEntity?>?>> call(params) async {
    return await repository.addTime(params.index, params.from, params.to);
  }
}

class AddTimeParams extends Equatable {
  final int index;
  final String from;
  final String to;

  AddTimeParams(this.index, this.from, this.to);

  @override
  List<Object> get props => [id];
}