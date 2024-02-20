import 'package:curriculum_front/src/core/service/dio_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module{

  @override
  void exportedBinds(Injector i){
    i.add(DioService.new);
  }

}