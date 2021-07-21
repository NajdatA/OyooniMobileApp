import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:senior_project/core/data/model/base_local_data_source.dart';
import 'package:senior_project/core/data/shared_preferences_keys.dart';

///
/// The [SplashLocalDataSource] interface declares all the interactions between the splash feature and the local data source
/// extends from the [BaseLocalDataSource]
///
abstract class SplashLocalDataSource extends BaseLocalDataSource {
  Future<String> get getUser;
}

///
/// The [SplashLocalDataSourceImpl] class has all the interactions between the splash feature and the local data source
/// extends from the [BaseLocalDataSourceImpl]
///
class SplashLocalDataSourceImpl extends BaseLocalDataSourceImpl
    implements SplashLocalDataSource {
  final SharedPreferences sharedPreferences;

  SplashLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<String> get getUser => Future.value(
      sharedPreferences.getString(SharedPreferencesKeys.USER));
}
