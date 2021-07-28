import 'package:json_annotation/json_annotation.dart';

part 'captioned_image_model.g.dart';

@JsonSerializable()
class CaptionedImageModel {
  static const String className = 'CaptionedImageModel';

  final String caption;

  CaptionedImageModel(this.caption);

  factory CaptionedImageModel.fromJson(Map<String, dynamic> json) => _$CaptionedImageModelFromJson(json);
}