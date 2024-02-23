import 'package:curriculum_front/src/modules/auth/auth_module.dart';
import 'package:curriculum_front/src/modules/home/screens/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{


  @override
  // TODO: implement imports
  List<Module> get imports => [
    AuthModule()
  ];


  @override
  void routes(RouteManager r) {
    // TODO: implement routes
    r.child("/", child: (_) => const HomeScreen());
  }
}