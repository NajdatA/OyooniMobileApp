// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimesModel _$PrayerTimesModelFromJson(Map<String, dynamic> json) {
  return PrayerTimesModel(
    PrayerName: json['PrayerName'] as String,
    iqama: json['iqama'] as int,
  );
}

Map<String, dynamic> _$PrayerTimesModelToJson(PrayerTimesModel instance) =>
    <String, dynamic>{
      'PrayerName': instance.PrayerName,
      'iqama': instance.iqama,
    };
