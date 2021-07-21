import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_local_data_source.dart';
import 'package:senior_project/core/data/shared_preferences_keys.dart';
import 'package:senior_project/features/sign_up/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SignUpLocalDataSource extends BaseLocalDataSource {
  Future<void> signUpUser(
    // UserModel userModel,
    String token,
    String refreshToken,
  );
}

class SignUpLocalDataSourceImpl extends BaseLocalDataSourceImpl
    implements SignUpLocalDataSource {
  SignUpLocalDataSourceImpl({
    @required SharedPreferences sharedPreferences,
  }) : super(
          sharedPreferences: sharedPreferences,
        );

  @override
  Future<void> signUpUser(
      // UserModel userModel,
      String token, String refreshToken) async {
    // sharedPreferences.setString(
    //   SharedPreferencesKeys.USER,
    //   json.encode(userModel.toJson()),
    // );
    sharedPreferences.setString(
      SharedPreferencesKeys.TOKEN,
      token,
    );
    sharedPreferences.setString(
      SharedPreferencesKeys.REFRESH_TOKEN,
      refreshToken,
    );
    sharedPreferences.setBool(
      SharedPreferencesKeys.IS_LOGGED_IN,
      true,
    );
    print(
      "Token in sp is ${sharedPreferences.getString(SharedPreferencesKeys.TOKEN)}");
  }
}
