import 'package:curriculum_front/src/modules/home/widgets/form_candidato.dart';
import 'package:flutter/material.dart';

class UserContent extends StatelessWidget {
  const UserContent({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de candidatura"),)
        ,
      body: const FormCandidato(),
    );
  }
}
