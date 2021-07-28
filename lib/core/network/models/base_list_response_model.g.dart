// GENERATED CODE - DO NOT MODIFY BY HAND

part of base_list_response_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponseModel<T> _$BaseListResponseModelFromJson<T>(
    Map<String, dynamic> json) {
  return BaseListResponseModel<T>(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => _Converter<T>().fromJson(e as Object))
        .toList(),
    message: json['msg'] as String?,
  );
}

Map<String, dynamic> _$BaseListResponseModelToJson<T>(
        BaseListResponseModel<T> instance) =>
    <String, dynamic>{
      'data': instance.data?.map(_Converter<T>().toJson).toList(),
      'msg': instance.message,
    };
