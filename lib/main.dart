import 'package:curriculum_front/app_widget.dart';
import 'package:curriculum_front/feature/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

class AppModule extends Module{

  @override
  void binds(i){

  }

  @override
  void routes(r){
    r.child("/", child: (_) => HomePage());
  }

}


