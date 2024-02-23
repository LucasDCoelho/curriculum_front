import 'package:flutter/material.dart';

class UserContent extends StatelessWidget {
  const UserContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Conteúdo para Usuário',
            style: TextStyle(fontSize: 24.0),
          ),
          // Adicione mais widgets aqui para conteúdo de usuário
        ],
      ),
    );
  }
}