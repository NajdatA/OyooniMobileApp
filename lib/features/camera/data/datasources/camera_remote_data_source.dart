import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_remote_datasource.dart';
import 'package:senior_project/core/network/models/base_response_model.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:http_parser/http_parser.dart';
import 'package:senior_project/features/camera/data/models/captioned_image_model.dart';
import 'package:senior_project/features/camera/data/models/recognized_banknote_model.dart';
import 'package:senior_project/features/camera/data/models/recognized_color_model.dart';

abstract class CameraRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponseModel<String>> textRecognition(String image);

  Future<BaseResponseModel<CaptionedImageModel>> imageCaptioning(String image);

  Future<BaseResponseModel<RecognizedBanknoteModel>> banknoteRecognition(
      String image);

  Future<BaseResponseModel<RecognizedColorModel>> colorRecognition(
      String image);
}

class CameraRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements CameraRemoteDataSource {
  CameraRemoteDataSourceImpl({
    required Dio dio,
  }) : super(
          dio: dio,
        );

  @override
  Future<BaseResponseModel<String>> textRecognition(String image) async {
    final file = await MultipartFile.fromFile(image,
        contentType: MediaType('image', '.jpg'));
    final response = await performPostRequest<String>(
      Endpoints.TEXT_RECOGNITION,
      FormData.fromMap({
        'File': file,
      }),
    );
    print(response);
    return response;
  }

  @override
  Future<BaseResponseModel<RecognizedBanknoteModel>> banknoteRecognition(
      String image) async {
    print('file is $image');
    final file = await MultipartFile.fromFile(image,
        contentType: MediaType('image', '.jpg'));
    final response = await performPostRequest<RecognizedBanknoteModel>(
      Endpoints.BANKNOTE_RECOGNITION,
      FormData.fromMap({
        'File': file,
      }),
    );
    print(response);
    return response;
  }

  @override
  Future<BaseResponseModel<RecognizedColorModel>> colorRecognition(
      String image) async {
    final file = await MultipartFile.fromFile(image,
        contentType: MediaType('image', '.jpg'));
    final response = await performPostRequest<RecognizedColorModel>(
      Endpoints.COLOR_RECOGNITION,
      FormData.fromMap({
        'File': file,
      }),
    );
    print(response);
    return response;
  }

  @override
  Future<BaseResponseModel<CaptionedImageModel>> imageCaptioning(
      String image) async {
    print('file is $image');
    final file = await MultipartFile.fromFile(image,
        contentType: MediaType('image', '.jpg'));
    final response = await performPostRequest<CaptionedImageModel>(
      Endpoints.IMAGE_CAPTIONING,
      FormData.fromMap({
        'File': file,
      }),
    );
    print(response);
    return response;
  }
}
