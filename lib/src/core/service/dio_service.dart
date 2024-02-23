import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class IHttpClient{
  Future post({
  required String url,
  required String login,
  required String password,
  });

  Future get({
    required url,
    required token
  });
}


class DioService implements IHttpClient{

  @override
  Future post({
    required String url,
    required String login,
    required String password,
  }) async {
    final client = Dio();
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

    return await client.request(
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
      final client = Dio();

      return await client.request(
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
  
}