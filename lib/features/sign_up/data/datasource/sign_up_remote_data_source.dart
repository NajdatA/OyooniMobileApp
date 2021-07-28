import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_remote_datasource.dart';
import 'package:senior_project/core/network/models/base_response_model.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/login/data/model/tokens_model.dart';
import 'package:senior_project/features/sign_up/data/model/tokens_model.dart';
import 'package:senior_project/features/sign_up/data/model/user_model.dart';

abstract class SignUpRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponseModel<TokensModel>> signUpUser(
      String email, String first, String last, String password, String confirmPassword);
}

class SignUpRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements SignUpRemoteDataSource {
  SignUpRemoteDataSourceImpl({
    required Dio dio,
  }) : super(
          dio: dio,
        );

  @override
  Future<BaseResponseModel<TokensModel>> signUpUser(
      String email, String first, String last, String password, String confirmPassword) async {
    final response = await performPostRequest<TokensModel>(
      Endpoints.SIGN_UP_URL,
      GetParams.getSignUpParams(email, first, last, password, confirmPassword),
    );
    return response;
  }
}
