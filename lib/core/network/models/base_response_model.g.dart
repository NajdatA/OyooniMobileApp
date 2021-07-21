// GENERATED CODE - DO NOT MODIFY BY HAND

part of base_response_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel<T> _$BaseResponseModelFromJson<T>(Map<String, dynamic> json) {
  return BaseResponseModel<T>(
    data: _dataFromJson(json['data']),
    message: json['message'] as String,
    errors: json['errors'] as String,
  );
}

Map<String, dynamic> _$BaseResponseModelToJson<T>(
        BaseResponseModel<T> instance) =>
    <String, dynamic>{
      'data': _dataToJson(instance.data),
      'message': instance.message,
      'errors': instance.errors,
    };
