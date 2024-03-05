import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class IHttpClient{
  Future postLogin({
  required String url,
  required String login,
  required String password,
  });


  Future postCandidato({
  required String url,
  required Map<String, dynamic>? headers,
  required Object? data,
  });

  Future get({
    required url,
    required token
  });
}


class DioService implements IHttpClient{
  late Dio _dio;

  DioService(){
    _dio = Dio();
  }

  String getBaseUrl(){
    return "https://api-curriculum.onrender.com";
  }

  @override
  Future postLogin({
    required String url,
    required String login,
    required String password,
  }) async {

    if (kDebugMode) {
      print(login);
    }
    if (kDebugMode) {
      print(password);
    }

    var data = jsonEncode({
      "login": login,
      "password": password
    });

    return await _dio.request(
      url,
      data: data,
      options: Options(
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        }
      )
    );
  }

  @override
  Future get({
    required url,
    required token
  }) async{


      return await _dio.request(
          url,
          options: Options(
            method: "GET",
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token"
            }
          )
      );
  }
  
  @override
  Future postCandidato({required String url, required Map<String, dynamic>? headers, required Object? data}) async{
    return await _dio.request(
      url,
      data: data,
      options: Options(
        method: "POST",
        headers: headers
      )
    );
  }
  
}