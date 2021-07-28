import 'dart:convert';
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:senior_project/core/error/error_handler.dart';
import 'package:senior_project/core/error/exceptions.dart';
import 'package:senior_project/core/network/models/base_list_response_model.dart';
import 'package:senior_project/core/network/models/base_response_model.dart';
import 'package:senior_project/core/util/constants.dart';

///
///
/// The [BaseRemoteDataSource] has the basic functions that each remote data source must have.
///
/// Each remote data source interface must extend from this interface
///

typedef Mapper<T> = T Function(Object);

abstract class BaseRemoteDataSource {
  ///
  /// This function performs a PUT http request to the specified [endpoint]
  /// with named parameter [token] that defaults to an empty string if the request does not require authentication
  ///
  /// uses [ErrorHandler.handleRemoteError] for error handling
  ///
  /// Returns:
  /// [T] which is passed to the function in order to know how to parse the json data
  ///
  /// Throws:
  ///  [ServerException] in two cases
  ///   a- With [ErrorCode.TIMEOUT] if the request has timed out
  ///   b- If the [ErrorHandler.handleRemoteError] throws an error
  ///
  @protected
  Future<BaseResponseModel<T>> performPutRequest<T>(
    String endpoint,
    Map<String, dynamic> data, {
    String token = '',
  });

  ///
  /// This function performs a PATCH http request to the specified [endpoint]
  /// with named parameter [token] that defaults to an empty string if the request does not require authentication
  ///
  /// uses [ErrorHandler.handleRemoteError] for error handling
  ///
  /// Returns:
  /// [T] which is passed to the function in order to know how to parse the json data
  ///
  /// Throws:
  ///  [ServerException] in two cases
  ///   a- With [ErrorCode.TIMEOUT] if the request has timed out
  ///   b- If the [ErrorHandler.handleRemoteError] throws an error
  ///
  @protected
  Future<BaseResponseModel<T?>?> performPatchRequest<T>(
    String endpoint,
    Map<String, dynamic> data, {
    String token = '',
  });

  @protected
  Future<BaseResponseModel<T?>?> performFormPatchRequest<T>(
    String endpoint,
    FormData data, {
    String token = '',
  });

  ///
  /// This function performs a POST http request to the specified [endpoint]
  /// with named parameter [token] that defaults to an empty string if the request does not require authentication
  ///
  /// uses [ErrorHandler.handleRemoteError] for error handling
  ///
  /// Returns:
  /// [T] which is passed to the function in order to know how to parse the json data
  ///
  /// Throws:
  ///  [ServerException] in two cases
  ///   a- With [ErrorCode.TIMEOUT] if the request has timed out
  ///   b- If the [ErrorHandler.handleRemoteError] throws an error
  ///
  @protected
  Future<BaseResponseModel<T>> performPostRequest<T>(
    String endpoint,
    Map<String, dynamic> data, {
    String token = '',
  });

  @protected
  Future<List<T?>?> performPostListRequest<T>(
    String endpoint,
    Map<String, dynamic> data, {
    String token = '',
  });

  ///
  /// This function performs a GET http request to the specified [endpoint]
  /// with named parameter [token] that defaults to an empty string if the request does not require authentication
  ///
  /// uses [ErrorHandler.handleRemoteError] for error handling
  ///
  /// Returns:
  /// Paginated [List] of [T] which is passed to the function in order to know how to parse the json data
  ///
  /// Throws:
  ///  [ServerException] in two cases
  ///   a- With [ErrorCode.TIMEOUT] if the request has timed out
  ///   b- If the [ErrorHandler.handleRemoteError] throws an error
  ///
  // @protected
  // Future<PaginatedData<T>> performGetPaginatedListRequest<T>(
  //   String endpoint, {
  //   Map<String, dynamic> params,
  //   String token = '',
  // });

  ///
  /// This function performs a GET http request to the specified [endpoint]
  /// with named parameter [token] that defaults to an empty string if the request does not require authentication
  ///
  /// uses [ErrorHandler.handleRemoteError] for error handling
  ///
  /// Returns:
  /// [List] of [T] which is passed to the function in order to know how to parse the json data
  ///
  /// Throws:
  ///  [ServerException] in two cases
  ///   a- With [ErrorCode.TIMEOUT] if the request has timed out
  ///   b- If the [ErrorHandler.handleRemoteError] throws an error
  ///
  @protected
  Future<List<T?>?> performGetListRequest<T>(
    String endpoint, {
    Map<String, dynamic> params,
    String token = '',
  });

  ///
  /// This function performs a GET http request to the specified [endpoint]
  /// with named parameter [token] that defaults to an empty string if the request does not require authentication
  ///
  /// uses [ErrorHandler.handleRemoteError] for error handling
  ///
  /// Returns:
  /// [T] which is passed to the function in order to know how to parse the json data
  ///
  /// Throws:
  ///  [ServerException] in two cases
  ///   a- With [ErrorCode.TIMEOUT] if the request has timed out
  ///   b- If the [ErrorHandler.handleRemoteError] throws an error
  ///
  @protected
  Future<T?> performGetRequest<T>(
    String endpoint, {
    Map<String, dynamic> params,
    String token = '',
  });
}

///
/// The [BaseRemoteDataSourceImpl] has the implementation of the basic functions that each remote data source must have.
///
/// Each remote data source class must extend from this class and implement a sub-interface of [BaseRemoteDataSource] interface.
///
class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final Dio dio;

  BaseRemoteDataSourceImpl({required this.dio});

  @override
  Future<T?> performGetRequest<T>(
    String endpoint, {
    Map<String, dynamic>? params,
    String token = '',
    bool withBaseResponse = true,
    Mapper<T>? mapper,
  }) async {
    try {
      print('>>>>>>>>>>. the url  ---> $endpoint');

      final response = await dio.get(
        endpoint,
        queryParameters: params,
        options: GetOptions.getOptionsWithToken(token),
      );

      if (ErrorHandler.handleRemoteError(response)) {
        if (withBaseResponse) {
          final baseResponse =
              BaseResponseModel<T>.fromJson(json.decode(response.data));

          if (baseResponse != null && baseResponse.data != null)
            return baseResponse.data;
          else
            throw ServerException(ErrorCode.SERVER_ERROR);
        } else {
          final jsonResponse = jsonDecode(response.data);
          if (jsonResponse is! Map && mapper == null ||
              jsonResponse['data'] == null)
            throw ServerException(ErrorCode.SERVER_ERROR);
          if (mapper == null) return null;
          return mapper(jsonResponse);
        }
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } on DioError catch (e) {
      print("haha error is $e");
      ErrorHandler.handleRemoteError(e.response!);
    }
  }

  @override
  Future<List<T?>?> performGetListRequest<T>(
    String endpoint, {
    Map<String, dynamic>? params,
    String token = '',
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        options: GetOptions.getOptionsWithToken(token),
        queryParameters: params,
      );

      if (ErrorHandler.handleRemoteError(response)) {
        final baseResponse =
            BaseListResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse != null && baseResponse.data != null)
          return baseResponse.data;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } on DioError catch (e) {
      ErrorHandler.handleRemoteError(e.response!);
    }
  }

  @override
  Future<List<T?>?> performPostListRequest<T>(
    String endpoint,
    Map<String, dynamic> data, {
    String token = '',
  }) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );

      if (ErrorHandler.handleRemoteError(response)) {
        final baseResponse =
            BaseListResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse != null && baseResponse.data != null)
          return baseResponse.data;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } on DioError catch (e) {
      ErrorHandler.handleRemoteError(e.response!);
    }
  }

  @override
  Future<BaseResponseModel<T>> performPostRequest<T>(
    String endpoint,
    dynamic data, {
    String token = '',
    String contentType = 'application/json',
  }) async {
    try {
      final options = GetOptions.getOptionsWithToken(
        token,
      );
      options.contentType = contentType;
      print('bbbbbbbbbbbbbbbbbbbbbbb');

      final response = await dio.post(
        endpoint,
        data: data,
        options: options,
      );
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      if (ErrorHandler.handleRemoteError(response)) {
        final baseResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } on DioError catch (e) {
      print("e is $e");
      // ErrorHandler.handleRemoteError(e.response);
      return BaseResponseModel<T>.fromJson({"errors": "something went wrong"});
      print("hhh");
    }
  }

  @override
  Future<BaseResponseModel<T?>?> performDeleteRequest<T>(
    String endpoint, {
    Map<String, dynamic>? data,
    bool withBaseResponse = true,
    Mapper<T>? mapper,
    String token = '',
  }) async {
    try {
      final response = await dio.delete(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (ErrorHandler.handleRemoteError(response)) {
        // if (mapper != null) return mapper(response.data);
        if (T.toString() == 'void' ||
            response.data == null ||
            response.data.toString().isEmpty) return null;
        final baseResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse != null && baseResponse.data != null) print('666666');
        if (baseResponse != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      print(e);
      if (e is ServerException)
        throw e;
      else
        throw ServerException(ErrorCode.SERVER_ERROR);
    }
  }

  @override
  Future<BaseResponseModel<T>> performPutRequest<T>(
    String endpoint,
    Map<String, dynamic> data, {
    String token = '',
  }) async {
    try {
      final response = await dio.put(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (ErrorHandler.handleRemoteError(response)) {
        final baseResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse != null && baseResponse.data != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } catch (e) {
      if (e is ServerException)
        throw e;
      else
        throw ServerException(ErrorCode.SERVER_ERROR);
    }
  }

  @override
  Future<BaseResponseModel<T?>?> performPatchRequest<T>(
      String endpoint, dynamic data,
      {String token = '', String? contentType}) async {
    try {
      print('qqqqq');
      String d = '33';
      d.parseInt;
      final response = await dio.patch(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(
          token,
        ),
      );
      if (ErrorHandler.handleRemoteError(response)) {
        return null;

        final baseResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse != null && baseResponse.data != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } on DioError catch (e) {
      ErrorHandler.handleRemoteError(e.response!);
    }
  }

  @override
  Future<BaseResponseModel<T?>?> performFormPatchRequest<T>(
    String endpoint,
    FormData data, {
    String token = '',
  }) async {
    try {
      String d = '33';
      d.parseInt;
      final response = await dio.patch(
        endpoint,
        data: data,
        options: GetOptions.getOptionsWithToken(token),
      );
      if (ErrorHandler.handleRemoteError(response)) {
        return null;
        final baseResponse =
            BaseResponseModel<T>.fromJson(json.decode(response.data));
        if (baseResponse != null && baseResponse.data != null)
          return baseResponse;
        else
          throw ServerException(ErrorCode.SERVER_ERROR);
      } else
        throw ServerException(ErrorCode.SERVER_ERROR);
    } on DioError catch (e) {
      ErrorHandler.handleRemoteError(e.response!);
    }
  }
}

extension GG on String {
  int get parseInt => int.parse(this);
}
