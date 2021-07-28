import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:senior_project/core/usecases/usecase.dart';
import 'package:senior_project/features/available_times/domain/entities/available_times_entity.dart';
import 'package:senior_project/features/available_times/domain/entities/times_entity.dart';
import 'package:senior_project/features/available_times/domain/usecases/add_time.dart';
import 'package:senior_project/features/available_times/domain/usecases/delete_time.dart';
import 'package:senior_project/features/available_times/domain/usecases/get_available_times.dart';
import 'available_times_event.dart';
import 'available_times_state.dart';

class AvailableTimesBloc
    extends Bloc<AvailableTimesEvent, AvailableTimesState> {
  final GetAvailableTimes getAvailableTimes;
  final DeleteTime deleteTime;
  final AddTime addTime;

  AvailableTimesBloc(this.getAvailableTimes, this.deleteTime, this.addTime)
      : super(AvailableTimesState.initial());

  onAvailableTimes() {
    add(GetAvailableTimesEvent());
  }

  onDeleteTime(String id, int index) {
    add(DeleteTimeEvent(id, index));
  }

  onAddTime(int index, String from, String to) {
    add(AddTimeEvent(index, from, to));
  }

  @override
  Stream<AvailableTimesState> mapEventToState(
      AvailableTimesEvent event) async* {
    print('${event.toString()}');
    if (event is GetAvailableTimesEvent) {
      print('haaa');
      yield state.rebuild((b) => b..isLoading = true);
      final result = await getAvailableTimes(NoParams());
      yield* result.fold(
        (l) async* {
          yield state.rebuild((b) => b..isLoading = false);
        },
        (r) async* {
          yield state.rebuild((b) => b
            ..isLoading = false
            ..availableTimes = r);
        },
      );
    } else if (event is DeleteTimeEvent) {
      print('haaa');
      yield state.rebuild((b) => b..isLoading = true);
      final result = await deleteTime(DeleteTimeParams(event.id));
      yield* result.fold(
        (l) async* {
          yield state.rebuild((b) => b..isLoading = false);
        },
        (r) async* {
          if (event.index == 0)
            yield state.rebuild((b) => b
              ..isLoading = false
              ..availableTimes!
                  .sun!
                  .removeWhere((element) => element!.id == event.id));
          else if (event.index == 1)
            yield state.rebuild((b) => b
              ..isLoading = false
              ..availableTimes!
                  .mon!
                  .removeWhere((element) => element!.id == event.id));
          else if (event.index == 2)
            yield state.rebuild((b) => b
              ..isLoading = false
              ..availableTimes!
                  .tues!
                  .removeWhere((element) => element!.id == event.id));
          else if (event.index == 3)
            yield state.rebuild((b) => b
              ..isLoading = false
              ..availableTimes!
                  .wed!
                  .removeWhere((element) => element!.id == event.id));
          else if (event.index == 4)
            yield state.rebuild((b) => b
              ..isLoading = false
              ..availableTimes!
                  .thurs!
                  .removeWhere((element) => element!.id == event.id));
          else if (event.index == 5)
            yield state.rebuild((b) => b
              ..isLoading = false
              ..availableTimes!
                  .fri!
                  .removeWhere((element) => element!.id == event.id));
          else if (event.index == 6)
            yield state.rebuild((b) => b
              ..isLoading = false
              ..availableTimes!
                  .sat!
                  .removeWhere((element) => element!.id == event.id));
        },
      );
    } else if (event is AddTimeEvent) {
      print('haaa');
      yield state.rebuild((b) => b..isLoading = true);
      final result =
          await addTime(AddTimeParams(event.index, event.from, event.to));
      yield* result.fold(
        (l) async* {
          yield state.rebuild((b) => b..isLoading = false);
        },
        (r) async* {
          print("sun length is ${state.availableTimes!.sun!.length}");
          yield state.rebuild((b) => b
            ..isLoading = false
            ..availableTimes = AvailableTimesEntity(
                event.index == 0 ? r : b.availableTimes!.sun!,
                event.index == 1 ? r : b.availableTimes!.mon!,
                event.index == 2 ? r : b.availableTimes!.tues!,
                event.index == 3 ? r : b.availableTimes!.wed!,
                event.index == 4 ? r : b.availableTimes!.thurs!,
                event.index == 5 ? r : b.availableTimes!.fri!,
                event.index == 6 ? r : b.availableTimes!.sat!));
          print("sun length is ${state.availableTimes!.sun!.length}");
        },
      );
    }
  }
}
