import 'package:curriculum_front/src/modules/auth/auth_module.dart';
import 'package:curriculum_front/src/modules/home/controllers/candidato_form_controller/candidato_form_controller.dart';
import 'package:curriculum_front/src/modules/home/dto/register_candidato_DTO.dart';
import 'package:curriculum_front/src/modules/home/screens/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{

  @override
  void exportedBinds(Injector i) {
    // TODO: implement exportedBinds
    i.add(CandidatoFormController.new);
  }

  @override
  // TODO: implement imports
  List<Module> get imports => [
    AuthModule()
  ];


  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const HomeScreen());
  }
}