import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:senior_project/core/Basic/Entity/ios_state.dart';
part 'ios_state_model.g.dart';
@JsonSerializable()
class IosStateModel extends IosState{
  static final String className = 'IosStateModel';
  final bool isLive;

  IosStateModel({@required this.isLive});

  factory IosStateModel.fromJson(Map<String, dynamic> json) => _$IosStateModelFromJson( json);
}