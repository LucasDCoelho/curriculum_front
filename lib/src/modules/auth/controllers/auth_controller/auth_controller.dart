

import 'package:curriculum_front/src/core/service/dio_service.dart';
import 'package:curriculum_front/src/modules/auth/controllers/token_controller/token_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../form_controller/form_controller.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store{
  final _baseUrl = "http://192.168.100.21:8080";
  final _dioService = Modular.get<DioService>();
  final formController = Modular.get<FormController>();

  final TokenController tokenController;
  _AuthController(this.tokenController);

  @observable
  String token = "";



  // Validations Form
  String? validateLogin(){
    if(formController.getLogin.isEmpty){
      return "Este campo é obrigatório";
    }
    if(formController.getLogin.length < 3){

      return "Seu login precisa ter mais de 3 caracteres";
    }

    return null;
  }

  String? validatePassword(){
    if(formController.getPassword.isEmpty){
      return "Este campo é obrigatório";
    }
    if(formController.getPassword.length < 8){
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
        final response = await _dioService.postLogin(
            url:"$_baseUrl/auth/login",
            login: formController.login,
            password: formController.password
        );
        token = response.data["token"];
        if (kDebugMode) {
          print(token);
        }

        await tokenController.saveToken(token);
        Modular.to.navigate("/home/");

        if (kDebugMode) {
          print("Login realizado com sucesso!");
        }
      } else{
        if (kDebugMode) {
          print("Login não validado!");
        }
      }
      
    } catch(e){
      if (kDebugMode) {
        print("Erro durante o login $e");
      }
    }
  }

  Future logout() async{
    await tokenController.clearToken();
    Modular.to.navigate("/login/");
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