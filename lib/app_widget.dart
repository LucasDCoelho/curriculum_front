import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: "Curriculum",
      theme: ThemeData(primarySwatch: Colors.indigo),
      routerConfig: Modular.routerConfig,
    );
  }
}