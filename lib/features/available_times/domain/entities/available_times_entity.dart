import 'package:equatable/equatable.dart';
import 'package:senior_project/features/available_times/domain/entities/times_entity.dart';

class AvailableTimesEntity extends Equatable {
  List<TimesEntity?>? sun;
  List<TimesEntity?>? mon;
  List<TimesEntity?>? tues;
  List<TimesEntity?>? wed;
  List<TimesEntity?>? thurs;
  List<TimesEntity?>? fri;
  List<TimesEntity?>? sat;

  AvailableTimesEntity(
      this.sun, this.mon, this.tues, this.wed, this.thurs, this.fri, this.sat);

  @override
  List<Object> get props => [
        sun!,
        mon!,
        tues!,
        wed!,
        thurs!,
        fri!,
        sat!,
      ];
}
