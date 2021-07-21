// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int,
    username: json['username'] as String,
    phoneNumber: json['phoneNumber'] as String,
    profilePicture: json['profilePicture'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'profilePicture': instance.profilePicture,
    };
