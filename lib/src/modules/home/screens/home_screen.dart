import 'package:curriculum_front/src/modules/auth/controllers/token_controller/token_controller.dart';
import 'package:curriculum_front/src/modules/home/screens/situacao_inscricao_screen.dart';
import 'package:curriculum_front/src/modules/home/widgets/adm_content.dart';
import 'package:curriculum_front/src/modules/home/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    final tokenController = Modular.get<TokenController>();



    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: tokenController.decodedToken(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if(snapshot.data == "DEV" || snapshot.data == "ADMIN"){
            return const AdminContent();
          }
          return const SituacaoInscricao();
        },)
    );
  }
}