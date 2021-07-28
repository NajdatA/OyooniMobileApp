// library tokens_model;
//
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'tokens_model.g.dart';
//
// @JsonSerializable()
// class TokensModel extends Equatable {
//   static final className = 'TokensModel';
//   final String token;
//   final String refreshToken;
//
//   TokensModel({
//     required this.token,
//     required this.refreshToken,
//   });
//
//   factory TokensModel.fromJson(Map<String, dynamic> json) {
//     return _$TokensModelFromJson(json);
//   }
//   Map<String,dynamic> toJson() => _$TokensModelToJson(this);
//
//   @override
//   List<Object> get props => [
//     token,
//     refreshToken,
//   ];
// }
