// ignore_for_file: prefer_const_constructors

import 'package:bookia_app/core/constant/constant.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: App_constant.url,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ));
  }

  static Future<Response> get(
      {required String endpoint,
      Map<String, dynamic>? headers,
      required Map<String, dynamic> data}) {
    return dio.get(endpoint,
        options: Options(
          headers: headers,
        ));
  }

  static Future<Response> post(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) {
    return dio.post(endpoint,
        data: data,
        options: Options(
          headers: headers,
        ));
  }

  static Future<Response> put(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) {
    return dio.post(endpoint,
        data: data,
        options: Options(
          headers: headers,
        ));
  }

  static Future<Response> delte(
      {required String endpoint, Map<String, dynamic>? headers}) {
    return dio.get(endpoint,
        options: Options(
          headers: headers,
        ));
  }
}
