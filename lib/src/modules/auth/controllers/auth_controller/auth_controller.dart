import 'package:curriculum_front/src/core/service/dio_service.dart';
import 'package:curriculum_front/src/modules/auth/controllers/token_controller/token_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../form_controller/form_controller.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final _baseUrl = "http://192.168.100.21:8080";
  // final _baseUrl = "https://api-curriculum.onrender.com";
  final _dioService = Modular.get<DioService>();

  final TokenController tokenController;
  final FormController formController;
  _AuthController(
    this.formController,
    this.tokenController
    );

  @observable
  String token = "";

  @observable
  late int idUsuarioLogado;

  @action
  void setIdUsuarioLogado(int id) {
    idUsuarioLogado = id;
  }

  // Validations Form
  @action
  String? validateLogin() {
    if (formController.getLogin.isEmpty) {
      return "Este campo é obrigatório";
    }
    if (formController.getLogin.length < 3) {
      return "Seu login precisa ter mais de 3 caracteres";
    }

    return null;
  }
  @action
  String? validatePassword() {
    if (formController.getPassword.isEmpty) {
      return "Este campo é obrigatório";
    }
    if (formController.getPassword.length < 8) {
      return "Sua senha precisa ter mais de 8 caracteres";
    }

    return null;
  }

  @computed
  bool get isValid {
    return validateLogin() == null && validatePassword() == null;
  }

  @action
  void clearFields() {
    formController.setLogin('');
    formController.setPassword('');
  }

  @observable
  bool isLoading = false;

  // Login
  @action
  Future login() async {
    try {
      isLoading = true;
      print(token);
      if (isValid) {
        final response = await _dioService.postLogin(
            url: "$_baseUrl/auth/login",
            login: formController.login,
            password: formController.password
        );
        token = response.data["token"];

        if (kDebugMode) {
          print(token);
        }

        clearFields();
        await tokenController.saveToken(token);
        Modular.to.pushReplacementNamed("/home");
        if (kDebugMode) {
          print("Login realizado com sucesso!");
        }
      } else {
        if (kDebugMode) {
          print("Login não validado!");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Erro durante o login $e");
      }
    } finally {
      isLoading = false;
    }
  
  }

  Future logout() async {
    await tokenController.clearToken();
    clearFields();
    token = "";
    Modular.to.navigate("/login");
  }

  bool isLogged() {
    print(token.isNotEmpty);
    print(token);
    if (token.isNotEmpty && token != "") {
      return true;
    }
    return false;
  }
}
