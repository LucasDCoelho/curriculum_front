import 'package:curriculum_front/src/core/core_module.dart';
import 'package:curriculum_front/src/modules/auth/auth_guard.dart';
import 'package:curriculum_front/src/modules/auth/auth_module.dart';
import 'package:curriculum_front/src/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{

  @override
  List<Module> get imports => [
    AuthModule(),
    HomeModule(),
    CoreModule()
  ];

  @override
  void routes(RouteManager r){
    r.module("/", module: CoreModule());
    r.module("/home", module: HomeModule(), guards: [AuthGuard()]);
    r.module("/login", module: AuthModule());
  }

}