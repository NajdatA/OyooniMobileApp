import 'package:json_annotation/json_annotation.dart';

part 'recognized_color_model.g.dart';

@JsonSerializable()
class RecognizedColorModel {
  static const String className = 'RecognizedColorModel';

  final int recognizedColor;

  RecognizedColorModel(this.recognizedColor);

  factory RecognizedColorModel.fromJson(Map<String, dynamic> json) => _$RecognizedColorModelFromJson(json);
}