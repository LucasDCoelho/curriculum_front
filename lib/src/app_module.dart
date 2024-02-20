import 'package:curriculum_front/src/modules/auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{

  @override
  List<Module> get imports => [
    AuthModule()
  ];

  @override
  void routes(RouteManager r){
    r.module("/", module: AuthModule());
  }

}