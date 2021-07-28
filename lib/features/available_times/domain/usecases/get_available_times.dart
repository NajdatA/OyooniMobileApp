import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/available_times/domain/entities/available_times_entity.dart';
import 'package:senior_project/features/available_times/domain/repositories/available_times_repository.dart';
import 'package:senior_project/features/login/domain/repository/login_repository.dart';

class GetAvailableTimes extends UseCase<AvailableTimesEntity, NoParams> {
  final AvailableTimesRepository repository;

  GetAvailableTimes({required this.repository});

  @override
  Future<Either<Failure, AvailableTimesEntity>> call(params) async {
    return await repository.getAvailableTimes();
  }
}