import 'package:json_annotation/json_annotation.dart';
import 'package:senior_project/features/available_times/data/models/times_model.dart';
import 'package:senior_project/features/available_times/domain/entities/available_times_entity.dart';

part 'available_times_model.g.dart';

@JsonSerializable()
class AvailableTimesModel extends AvailableTimesEntity {
  static final String className = 'AvailableTimesModel';

  @JsonKey(name: "0", nullable: true)
  final List<TimesModel> sun;
  @JsonKey(name: "1", nullable: true)
  final List<TimesModel> mon;
  @JsonKey(name: "2", nullable: true)
  final List<TimesModel> tues;
  @JsonKey(name: "3", nullable: true)
  final List<TimesModel> wed;
  @JsonKey(name: "4", nullable: true)
  final List<TimesModel> thurs;
  @JsonKey(name: "5", nullable: true)
  final List<TimesModel> fri;
  @JsonKey(name: "6", nullable: true)
  final List<TimesModel> sat;

  AvailableTimesModel(
      this.sun, this.mon, this.tues, this.wed, this.thurs, this.fri, this.sat)
      : super(
          sun,
          mon,
          tues,
          wed,
          thurs,
          fri,
          sat,
        );

  factory AvailableTimesModel.fromJson(Map<String, dynamic> json) => _$AvailableTimesModelFromJson(json);
}
