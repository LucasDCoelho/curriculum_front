

import 'package:curriculum_front/src/core/service/dio_service.dart';
import 'package:curriculum_front/src/modules/auth/controllers/token_controller/token_controller.dart';
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

  final TokenController tokenController;
  _AuthController(this.tokenController);

  @observable
  String token = "";


  // Validations Form
  String? validateLogin(){
    if(formController.login.isEmpty){
      return "Este campo é obrigatório";
    }
    if(formController.login.length < 3){
      return "Seu login precisa ter mais de 3 caracteres";
    }

    return null;
  }

  String? validatePassword(){
    if(formController.password.isEmpty){
      return "Este campo é obrigatório";
    }
    if(formController.password.length < 8){
      return "Sua senha precisa ter mais de 8 caracteres";
    }

    return null;
  }

  @computed
  bool get isValid{
    return validateLogin() == null && validatePassword() == null;
  }


  // Login
  @action
  Future login() async{
    try{
      if(isValid){
        final response = await _dioService.post(
            url:"$_baseUrl/auth/login",
            login: formController.login,
            password: formController.password
        );
        token = response.data["token"];

        await tokenController.saveToken(token);
        Modular.to.pushNamed("/home/");
      }
      if (kDebugMode) {
        print("Login bem sucedido!");
      }
    } catch(e){
      if (kDebugMode) {
        print("Erro durante o login $e");
      }
    }
  }

  Future logout() async{
    await tokenController.clearToken();
    Modular.to.pop();
    token = "";
  }

  bool isLogged(){
    print(token.isNotEmpty);
    print(token);
    if(token.isNotEmpty && token != ""){
      return true;
    }
    return false;
  }
}