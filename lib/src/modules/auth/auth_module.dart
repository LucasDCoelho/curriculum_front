
import 'package:curriculum_front/src/core/core_module.dart';
import 'package:curriculum_front/src/modules/auth/controllers/auth_controller/auth_controller.dart';
import 'package:curriculum_front/src/modules/auth/controllers/form_controller/form_controller.dart';
import 'package:curriculum_front/src/modules/auth/controllers/token_controller/token_controller.dart';
import 'package:curriculum_front/src/modules/auth/screens/login_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module{

  @override
  void exportedBinds(Injector i){
    i.add(FormController.new);
    i.add(AuthController.new);
    i.add(TokenController.new);
  }

  @override
  List<Module> get imports => [
    CoreModule(),
  ];


  @override
  void routes(RouteManager r){
    r.child("/", child: (context) => const LoginScreen());
  }

}