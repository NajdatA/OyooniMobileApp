import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource extends BaseLocalDataSource {
  // Future<void> loginUser(
  //   UserModel userModel,
  //   String token,
  //   String refreshToken,
  // );
}

class LoginLocalDataSourceImpl extends BaseLocalDataSourceImpl
    implements LoginLocalDataSource {
  LoginLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : super(
          sharedPreferences: sharedPreferences,
        );

  // @override
  // Future<void> loginUser(
  //     UserModel userModel, String token, String refreshToken) async {
  //   print('login user inside login local datasource');
  //   sharedPreferences.setString(
  //     SharedPreferencesKeys.USER,
  //     json.encode(userModel.toJson()),
  //   );
  //   sharedPreferences.setInt(
  //     SharedPreferencesKeys.COMPANY_ID,
  //     userModel.personalInfo.companyId,
  //   );
  //   sharedPreferences.setString(
  //     SharedPreferencesKeys.TOKEN,
  //     token,
  //   );
  //   sharedPreferences.setString(
  //     SharedPreferencesKeys.REFRESH_TOKEN,
  //     refreshToken,
  //   );
  //   sharedPreferences.setBool(
  //     SharedPreferencesKeys.IS_LOGGED_IN,
  //     true,
  //   );
  //   print(sharedPreferences.getString(SharedPreferencesKeys.TOKEN));
  // }

}
