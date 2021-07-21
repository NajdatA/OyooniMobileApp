import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:senior_project/core/Basic/Entity/prayer_times_entity.dart';
import 'dart:convert';
part 'prayer_times_model.g.dart';

@JsonSerializable()
class PrayerTimesModel extends PrayerTimesEntity{

  final String PrayerName;
  final int iqama;

  PrayerTimesModel({
    @required this.PrayerName,
    @required   this.iqama});

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) => _$PrayerTimesModelFromJson(json);
  Map<String, dynamic> toJson() => _$PrayerTimesModelToJson(this);

}