import 'package:curriculum_front/src/modules/auth/auth_module.dart';
import 'package:curriculum_front/src/modules/home/controllers/admin_content_controller.dart';
import 'package:curriculum_front/src/modules/home/controllers/candidato_form_controller/candidato_form_controller.dart';
import 'package:curriculum_front/src/modules/home/screens/details/details_candidato_screen.dart';
import 'package:curriculum_front/src/modules/home/screens/home_screen.dart';
import 'package:curriculum_front/src/modules/home/screens/situacao_inscricao_screen.dart';
import 'package:curriculum_front/src/modules/home/widgets/user_content.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module{

  @override
  void exportedBinds(Injector i) {
    i.add(CandidatoFormController.new);
    i.add(AdminContentController.new);
  }

  @override
  List<Module> get imports => [
    AuthModule(),
  ];


  @override
  void routes(RouteManager r) {
    r.child("/", child: (context) => const HomeScreen());
    r.child("/details", child: (context) => const DetailsScreen());
    r.child("/situacao", child: (context) => const SituacaoInscricao());
    r.child("/register", child: (context) => const UserContent());
  }
}