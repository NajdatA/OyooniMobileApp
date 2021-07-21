import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PrayerTimesEntity extends Equatable {
  final String prayerName;
  int iqama;

  PrayerTimesEntity({@required this.prayerName, @required this.iqama});

  @override
  List<Object> get props => [this.prayerName, this.iqama];
}
