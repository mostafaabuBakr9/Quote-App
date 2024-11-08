// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:quote_app/core/Api/Api_consumer.dart';
import 'package:quote_app/core/Api/App_interceptor.dart';
import 'package:quote_app/core/Api/end_point.dart';
import 'package:quote_app/core/Api/staus_code.dart';
import 'package:quote_app/core/error/exceptions.dart';
import 'package:quote_app/injection_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options = BaseOptions(
      baseUrl: EndPoint.baseUrl,
      responseType: ResponseType.plain,
      followRedirects: false,
      validateStatus: (status) {
        return status! < StausCode.internalServerError;
      },
    );
    client.interceptors.add(di.sl<AppInterceptor>());
    client.interceptors.add(di.sl<LogInterceptor>());
  }
  @override
  Future get(
      {required String url,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? headers}) async {
    try {
      final response =
          await client.get(url, options: Options(headers: headers,     ));
      return handleResponseAsJson(response);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future post({required String url, Map<String, dynamic>? headers}) async {
    try {
      final response =
          await client.post(url, options: Options(headers: headers));
      return handleResponseAsJson(response);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future put({required String url, Map<String, dynamic>? headers}) async {
    try {
      final response =
          await client.put(url, options: Options(headers: headers));
      return handleResponseAsJson(response);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  dynamic handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StausCode.badRequest:
            throw const BadRequestException();
          case StausCode.unauthorized:
          case StausCode.forbidden:
            throw const UnauthorizedException();
          case StausCode.notFound:
            throw const NotFoundException();
          case StausCode.conflict:
            throw const ConflictException();
          case StausCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
    }
  }
}
