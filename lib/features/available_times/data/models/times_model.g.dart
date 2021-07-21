// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimesModel _$TimesModelFromJson(Map<String, dynamic> json) {
  return TimesModel(
    json['id'] as String,
    json['dayOfWeekId'] as int,
    json['from'] as String,
    json['to'] as String,
  );
}

Map<String, dynamic> _$TimesModelToJson(TimesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayOfWeekId': instance.dayOfWeekId,
      'from': instance.from,
      'to': instance.to,
    };
