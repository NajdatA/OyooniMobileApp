// GENERATED CODE - DO NOT MODIFY BY HAND

part of base_list_response_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponseModel<T> _$BaseListResponseModelFromJson<T>(
    Map<String, dynamic> json) {
  return BaseListResponseModel<T>(
    data: (json['data'] as List)?.map(_Converter<T>().fromJson)?.toList(),
    message: json['msg'] as String,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$BaseListResponseModelToJson<T>(
        BaseListResponseModel<T> instance) =>
    <String, dynamic>{
      'data': instance.data?.map(_Converter<T>().toJson)?.toList(),
      'msg': instance.message,
      'total': instance.total,
    };
