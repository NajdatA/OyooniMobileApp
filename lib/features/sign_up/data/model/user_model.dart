library user_model;

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:senior_project/features/sign_up/domain/entity/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  static final className = 'UserModel';
  final int id;
  final String username;
  final String email;
  final String phoneNumber;
  final String profilePicture;

  UserModel({
    @required this.id,
    @required this.username,
    @required this.phoneNumber='',
    @required this.profilePicture,
    @required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }
  Map<String,dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object> get props => [
        id,
        email,
        phoneNumber,
        username,
    profilePicture
      ];
}
