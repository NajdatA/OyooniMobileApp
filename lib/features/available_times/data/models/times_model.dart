import 'package:json_annotation/json_annotation.dart';
import 'package:senior_project/features/available_times/domain/entities/times_entity.dart';

part 'times_model.g.dart';

@JsonSerializable()
class TimesModel extends TimesEntity {
  static final String className = 'TimesModel';

  final String id;
  final int dayOfWeekId;
  final String from;
  final String to;

  TimesModel(this.id, this.dayOfWeekId, this.from, this.to)
      : super(
          id,
          dayOfWeekId,
          from,
          to,
        );

  factory TimesModel.fromJson(Map<String, dynamic> json) => _$TimesModelFromJson(json);
}
