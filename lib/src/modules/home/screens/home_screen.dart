import 'package:curriculum_front/src/modules/auth/controllers/auth_controller/auth_controller.dart';
import 'package:curriculum_front/src/modules/auth/controllers/token_controller/token_controller.dart';
import 'package:curriculum_front/src/modules/home/widgets/adm_content.dart';
import 'package:curriculum_front/src/modules/home/widgets/user_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    final tokenController = Modular.get<TokenController>();
    final authController = Modular.get<AuthController>();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page')
      ),
      drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Adicione aqui a ação que deseja realizar quando o item 1 for selecionado
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Adicione aqui a ação que deseja realizar quando o item 2 for selecionado
          },
        ),
        ListTile(
          title: Text('Sair'),
          onTap: () {
            // Adicione aqui a ação para sair
            authController.logout();
          },
        ),
      ],
    ),
  ),
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