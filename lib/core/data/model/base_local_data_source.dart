import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:senior_project/core/data/shared_preferences_keys.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
///
/// The [BaseLocalDataSource] interface declares the basic interactions with the local data source.
///
/// All the getters and functions in this class returns a [Future] which we might NOT need in some cases
/// but we might change [SharedPreferences] package during the development period
/// and most of the local data source accessors need an async call
/// so if we change the package later, we only need to edit the local data sources
///
/// Each local data source interface must extend from this interface
///
///
abstract class BaseLocalDataSource {
  /// [BaseLocalDataSource.token] getter returns a future of String which is the user's token
  Future<String> get token;

  /// [BaseLocalDataSource.refreshToken] getter returns a future of String which is the user's refresh token
  Future<String> get refreshToken;

  /// [BaseLocalDataSource.user] getter returns a future of UserModel which is the current system user
  Future<String> get user;

  Future<AppLanguage> get appLanguage;

  Future<bool> setAppLanguage(AppLanguage language);

  ///
  /// The [updateToken] function for updating the old token with the new refreshed token value
  ///
  ///
  /// @input:
  ///   - [String] user's token
  ///
  /// @returns:
  ///   [Future] of void completes after the local data source do its async work
  ///
  ///
  Future<bool> updateToken(
    String token,
    String refreshToken,
  );

  Future<void> updateLoginToken(
    String token,
  );

  ///
  /// The [logOutUser] function for logging  the user out of  the system
  ///
  /// @returns:
  ///   [Future] of void completes after the local data source do its async work
  ///
  ///
  Future<void> logOutUser();

  // Future<void> updateUser(
  //   UserModel userModel,
  // );
}

/// [BaseLocalDataSourceImpl] is the implementation of the [BaseLocalDataSource] interface
/// each local data source must extend this class and implement a sub-interface of [BaseLocalDataSource] interface.
class BaseLocalDataSourceImpl implements BaseLocalDataSource {
  final SharedPreferences sharedPreferences;

  BaseLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  // Returns the user's token
  @override
  Future<String> get token =>
      Future.value(sharedPreferences.getString(SharedPreferencesKeys.TOKEN));

  @override
  Future<String> get refreshToken => Future.value(
      sharedPreferences.getString(SharedPreferencesKeys.REFRESH_TOKEN));

//Returns the current system user
  @override
  Future<String> get user =>
      Future.value(sharedPreferences.getString(SharedPreferencesKeys.USER));

  Future<AppLanguage> get appLanguage => Future.value(
      sharedPreferences.getString(SharedPreferencesKeys.APP_LANGUAGE) == 'ar'
          ? AppLanguage.AR
          : AppLanguage.EN);

  @override
  Future<bool> setAppLanguage(AppLanguage language) {
    print('language is $language');
    sharedPreferences.setString(SharedPreferencesKeys.APP_LANGUAGE,
        language == AppLanguage.AR ? "ar" : 'en');
    return Future.value();
  }

  @override
  Future<bool> updateToken(String token, String refreshToken) {
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
    return Future.value(true);
  }

  @override
  Future<bool> updateLoginToken(String token) {
    sharedPreferences.setString(
      SharedPreferencesKeys.LOGIN_TOKEN,
      token,
    );
    return Future.value(true);
  }

  @override
  Future<void> logOutUser() async {
    await sharedPreferences.remove(SharedPreferencesKeys.EMAIL);
    await sharedPreferences.remove(SharedPreferencesKeys.TOKEN);
    await sharedPreferences.remove(SharedPreferencesKeys.REFRESH_TOKEN);
    await sharedPreferences.remove(SharedPreferencesKeys.IS_LOGGED_IN);
    await sharedPreferences.remove(SharedPreferencesKeys.USER);
  }

  // @override
  // Future<void> updateUser(UserModel userModel) async {
  //   await sharedPreferences.setString(
  //     SharedPreferencesKeys.USER,
  //     json.encode(userModel.toJson()),
  //   );
  // }
}
