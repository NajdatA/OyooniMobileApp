library base_response_model;

import 'package:json_annotation/json_annotation.dart';
import 'package:senior_project/features/available_times/data/models/available_times_model.dart';
import 'package:senior_project/features/camera/data/models/captioned_image_model.dart';
import 'package:senior_project/features/camera/data/models/recognized_banknote_model.dart';
import 'package:senior_project/features/camera/data/models/recognized_color_model.dart';
import 'package:senior_project/features/login/data/model/tokens_model.dart';
import 'package:senior_project/features/sign_up/data/model/tokens_model.dart';

part 'base_response_model.g.dart';

///
///
/// The [BaseResponseModel] class is the wrapper for all the models that are received as an object, not a list
///
/// The [T] must be a model which is annotated with [@JsonSerializable] annotation
///
///
@JsonSerializable()
class BaseResponseModel<T> {
  @JsonKey(
    fromJson: _dataFromJson,
    toJson: _dataToJson,
  )
  final T? data;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey()
  final String? errors;

  BaseResponseModel({
    this.data,
    this.message,
    this.errors,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson<T>(json);
}

T? _dataFromJson<T>(dynamic data) {
  print('T is ${T.toString()} $data');
  if (data is Map<String, dynamic>) {
    if (T.toString() == 'Null') return null;
    if (T.toString() == 'String') return data as T;
    if (T.toString() == "int") {
      print('11111111');
      print(data);
      return data["id"] ?? 1 as T;
    }
    if (T.toString() == TokensModel.className) {
      return TokensModel.fromJson(data) as T;
    } else if (T.toString() == AvailableTimesModel.className) {
      return AvailableTimesModel.fromJson(data) as T;
    } else if (T.toString() == CaptionedImageModel.className) {
      return CaptionedImageModel.fromJson(data) as T;
    } else if (T.toString() == RecognizedBanknoteModel.className) {
      return RecognizedBanknoteModel.fromJson(data) as T;
    } else if (T.toString() == RecognizedColorModel.className) {
      return RecognizedColorModel.fromJson(data) as T;
    }
  }
}

Map<String, dynamic>? _dataToJson<T, S, U>(T input, [S? other1, U? other2]) =>
    {'data': input};
