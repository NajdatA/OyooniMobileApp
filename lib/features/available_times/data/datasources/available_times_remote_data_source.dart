import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/data/model/base_remote_datasource.dart';
import 'package:senior_project/core/network/models/base_response_model.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:senior_project/features/available_times/data/models/available_times_model.dart';
import 'package:senior_project/features/available_times/data/models/times_model.dart';

abstract class AvailableTimesRemoteDataSource extends BaseRemoteDataSource {
  Future<AvailableTimesModel> getAvailableTimes(String token);
  Future<String> deleteTime(String token, String id);
  Future<List<TimesModel>> addTime(String token, int index, String from, String to);
}

class AvailableTimesRemoteDataSourceImpl extends BaseRemoteDataSourceImpl
    implements AvailableTimesRemoteDataSource {
  AvailableTimesRemoteDataSourceImpl({
    @required Dio dio,
  }) : super(
    dio: dio,
  );

  @override
  Future<AvailableTimesModel> getAvailableTimes(String token) async {
    final response = await performGetRequest<AvailableTimesModel>(
      Endpoints.AVAILABLE_TIMES_URL,
      token: token,
    );
    print("response is $response");
    // print(response);
    return response;
  }

  @override
  Future<String> deleteTime(String token, String id) async {
    final response = await performDeleteRequest<String>(
      Endpoints.AVAILABLE_TIMES_URL + '/$id',
      token: token,
    );
    print("response is $response");
    // print(response);
    return response.message;
  }

  @override
  Future<List<TimesModel>> addTime(String token, int index, String from, String to) async {
    final response = await performPostListRequest<TimesModel>(
      Endpoints.AVAILABLE_TIMES_URL,
      {
        'dayOfWeekId': index,
        'from': from,
        'to': to,
      },
      token: token,
    );
    print("response is $response");
    // print(response);
    return response;
  }
}
