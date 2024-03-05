import 'package:curriculum_front/src/core/screens/splash_screen.dart';
import 'package:curriculum_front/src/core/service/dio_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module{

  @override
  void exportedBinds(Injector i){
    i.add(DioService.new);
  }
  

  @override
  void routes(RouteManager r) {
    // TODO: implement routes
    r.child("/", child: (_) => const SplashScreen());
  }

}