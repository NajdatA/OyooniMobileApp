import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_remote_datasource.dart';
import 'package:senior_project/core/network/models/base_response_model.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/login/data/model/tokens_model.dart';

abstract class LoginRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponseModel<TokensModel>> loginUser(String email, String password);
}

class LoginRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl({
    required Dio dio,
  }) : super(
          dio: dio,
        );

  @override
  Future<BaseResponseModel<TokensModel>> loginUser(String email, String password) async {
    final response = await performPostRequest<TokensModel>(
      Endpoints.LOGIN_URL,
      GetParams.getLoginParams(
        email,
        password,
        ),
    );
    print(response);
    return response;
  }
}
