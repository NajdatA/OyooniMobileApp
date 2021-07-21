// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableTimesModel _$AvailableTimesModelFromJson(Map<String, dynamic> json) {
  return AvailableTimesModel(
    (json['0'] as List)
        ?.map((e) =>
            e == null ? null : TimesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['1'] as List)
        ?.map((e) =>
            e == null ? null : TimesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['2'] as List)
        ?.map((e) =>
            e == null ? null : TimesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['3'] as List)
        ?.map((e) =>
            e == null ? null : TimesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['4'] as List)
        ?.map((e) =>
            e == null ? null : TimesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['5'] as List)
        ?.map((e) =>
            e == null ? null : TimesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['6'] as List)
        ?.map((e) =>
            e == null ? null : TimesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AvailableTimesModelToJson(
        AvailableTimesModel instance) =>
    <String, dynamic>{
      '0': instance.sun,
      '1': instance.mon,
      '2': instance.tues,
      '3': instance.wed,
      '4': instance.thurs,
      '5': instance.fri,
      '6': instance.sat,
    };
