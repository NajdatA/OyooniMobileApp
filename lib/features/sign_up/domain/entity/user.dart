import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

///
/// GitScrum #TK-12
///
/// [User] class is representing the user entity
///
class User extends Equatable {
  final int id;
  final String username;
  final String phoneNumber;
  final String email;
  final String profileImage;

  User(
      {required this.id,
      required this.username,
      required this.phoneNumber,
      required this.email,
      required this.profileImage});

  @override
  List<Object> get props => [
        id,
        email,
        username,
        profileImage,
        phoneNumber,
      ];
}
