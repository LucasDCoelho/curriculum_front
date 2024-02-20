import 'package:curriculum_front/src/core/service/dio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../form_controller/form_controller.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store{
  final _baseUrl = "http://192.168.100.10:8080";
  final _dioService = Modular.get<DioService>();
  final formController = Modular.get<FormController>();

  @action
  Future login() async{
    try{
      await _dioService.post(
          url:"$_baseUrl/auth/login",
          login: formController.login,
          password: formController.password
      );
      if (kDebugMode) {
        print("Login bem sucedido!");
      }
    } catch(e){
      if (kDebugMode) {
        print("Erro durante o login $e");
      }
    }
  }
}