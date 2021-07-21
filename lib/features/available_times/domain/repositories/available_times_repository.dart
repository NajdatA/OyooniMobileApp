import 'package:dartz/dartz.dart';
import 'package:senior_project/core/data/repository/base_repository.dart';
import 'package:senior_project/core/error/failures.dart';
import 'package:senior_project/features/available_times/domain/entities/available_times_entity.dart';
import 'package:senior_project/features/available_times/domain/entities/times_entity.dart';

abstract class AvailableTimesRepository extends BaseRepository {
  Future<Either<Failure, AvailableTimesEntity>> getAvailableTimes();
  Future<Either<Failure, String>> deleteTime(String id);
  Future<Either<Failure, List<TimesEntity>>> addTime(int index, String from, String to);
}
