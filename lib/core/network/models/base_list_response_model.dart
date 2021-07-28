library base_list_response_model;

import 'package:json_annotation/json_annotation.dart';
import 'package:senior_project/features/available_times/data/models/times_model.dart';

part 'base_list_response_model.g.dart';

///
///
/// The [BaseListResponseModel] class is the wrapper for all the models that are list based
///
/// The [T] must be a model which is annotated with [@JsonSerializable] annotation
///
///
@JsonSerializable()
class BaseListResponseModel<T> {
  @JsonKey(name: 'data')
  @_Converter()
  final List<T>? data;

  @JsonKey(name: 'msg')
  final String? message;

  BaseListResponseModel({
    this.data,
    this.message,
  });

  factory BaseListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseListResponseModelFromJson<T>(json);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    try {
      if (json is Map<String, dynamic>) {
        print(json);
        print(T.toString());
        if(T.toString() == TimesModel.className)
          return TimesModel.fromJson(json) as T;
      }
      return json as T;
    } catch (e) {
      print('--- _Converter.fromJson => ERROR: $e');
      throw e;
    }
  }

  @override
  Object toJson(T object) {
    return object as Object;
  }
}
