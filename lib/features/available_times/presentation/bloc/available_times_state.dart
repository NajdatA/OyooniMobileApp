library available_times_state;

import 'package:built_value/built_value.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/available_times/domain/entities/available_times_entity.dart';

part 'available_times_state.g.dart';

abstract class AvailableTimesState implements Built<AvailableTimesState, AvailableTimesStateBuilder> {

  bool get isLoading;

  @nullable
  AvailableTimesEntity get availableTimes;

  AvailableTimesState._();

  factory AvailableTimesState([updates(AvailableTimesStateBuilder b)]) = _$AvailableTimesState;

  factory AvailableTimesState.initial() {
    return AvailableTimesState((b) => b..isLoading = false);
  }
}
