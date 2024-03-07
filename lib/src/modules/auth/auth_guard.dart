import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'controllers/token_controller/token_controller.dart';

class AuthGuard extends RouteGuard{
  AuthGuard() : super(redirectTo: "/login/");

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {

    final tokenController = Modular.get<TokenController>();
    final hasToken = await tokenController.isGetToken(); 
    final hasTokenExpired = await tokenController.isTokenValid();
    print(hasToken);
    print(hasTokenExpired);

    return hasToken && hasTokenExpired;
  }

}
