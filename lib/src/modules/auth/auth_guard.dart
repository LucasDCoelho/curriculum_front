import 'dart:async';
import 'package:curriculum_front/src/modules/auth/controllers/auth_controller/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/token_controller/token_controller.dart';

class AuthGuard extends RouteGuard{
  AuthGuard() : super(redirectTo: "/login/");

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {

    final tokenController = Modular.get<TokenController>();
    final hasToken = await tokenController.isGetToken(); 
    final hasTokenExpired = await tokenController.isTokenValid();

    if (hasToken && hasTokenExpired) {
      return true; // Permite a navegação normal
    } else {
      return false; // Interrompe o fluxo de navegação
    }
  }

}
