import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_remote_datasource.dart';
import 'package:senior_project/core/network/models/base_response_model.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:http_parser/http_parser.dart';

abstract class CameraRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponseModel<String>> textRecognition(File image);
  Future<BaseResponseModel<String>> imageCaptioning(File image);
  Future<BaseResponseModel<int>> banknoteRecognition(File image);
}

class CameraRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements CameraRemoteDataSource {
  CameraRemoteDataSourceImpl({
    @required Dio dio,
  }) : super(
    dio: dio,
  );

  @override
  Future<BaseResponseModel<String>> textRecognition(File image) async {
    final response = await performPostRequest<String>(
      Endpoints.TEXT_RECOGNITION,
      {
        'file': MultipartFile.fromFileSync(image.path, contentType: MediaType('image', '.png')),
      },
    );
    print(response);
    return response;
  }

  @override
  Future<BaseResponseModel<int>> banknoteRecognition(File image) async {
    final response = await performPostRequest<int>(
      Endpoints.BANKNOTE_RECOGNITION,
      {
        'file': MultipartFile.fromFileSync(image.path, contentType: MediaType('image', '.png')),
      },
    );
    print(response);
    return response;
  }

  @override
  Future<BaseResponseModel<String>> imageCaptioning(File image) async {
    final response = await performPostRequest<String>(
      Endpoints.IMAGE_CAPTIONING,
      {
        'file': MultipartFile.fromFileSync(image.path, contentType: MediaType('image', '.png')),
      },
    );
    print(response);
    return response;
  }
}
