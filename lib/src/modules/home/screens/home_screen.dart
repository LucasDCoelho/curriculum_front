import 'package:curriculum_front/src/modules/auth/controllers/auth_controller/auth_controller.dart';
import 'package:curriculum_front/src/modules/auth/controllers/token_controller/token_controller.dart';
import 'package:curriculum_front/src/modules/auth/widget/observer_button.dart';
import 'package:curriculum_front/src/modules/home/widgets/adm_content.dart';
import 'package:curriculum_front/src/modules/home/widgets/user_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    final tokenController = Modular.get<TokenController>();


    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: FutureBuilder(
        future: tokenController.decodedToken(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if(snapshot.data == "DEV" || snapshot.data == "ADMIN"){
            return const AdminContent();
          }
          return const UserContent();
        },)
    );
  }
}