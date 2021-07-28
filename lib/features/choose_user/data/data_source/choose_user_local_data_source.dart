import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:senior_project/core/data/model/base_local_data_source.dart';
import 'package:senior_project/core/data/shared_preferences_keys.dart';

abstract class ChooseUserLocalDataSource extends BaseLocalDataSource {
  Future<String> chooseUser(String user);
}

class ChooseUserLocalDataSourceImpl extends BaseLocalDataSourceImpl
    implements ChooseUserLocalDataSource {
  final SharedPreferences sharedPreferences;

  ChooseUserLocalDataSourceImpl({required this.sharedPreferences}) : super(sharedPreferences: sharedPreferences);

  @override
  Future<String> chooseUser(String user) async {
    Future.value(
        sharedPreferences.setString(SharedPreferencesKeys.USER, user));
    return user;
  }
}
