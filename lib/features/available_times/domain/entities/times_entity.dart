import 'package:equatable/equatable.dart';

class TimesEntity extends Equatable {
  final String id;
  final int dayOfWeekId;
  final String from;
  final String to;

  TimesEntity(this.id, this.dayOfWeekId, this.from, this.to);

  @override
  List<Object> get props => [
    id,
    dayOfWeekId,
    from,
    to,
  ];
}
