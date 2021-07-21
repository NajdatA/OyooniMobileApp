import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:senior_project/core/data/model/base_local_data_source.dart';
import 'package:senior_project/core/data/shared_preferences_keys.dart';

abstract class SignalRConnectionLocalDataSource extends BaseLocalDataSource {
  Future<String> get getToken;
}

class SignalRConnectionLocalDataSourceImpl extends BaseLocalDataSourceImpl
    implements SignalRConnectionLocalDataSource {
  final SharedPreferences sharedPreferences;

  SignalRConnectionLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<String> get getToken => Future.value(
      sharedPreferences.getString(SharedPreferencesKeys.TOKEN));
}
