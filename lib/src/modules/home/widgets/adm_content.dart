import 'package:curriculum_front/src/modules/home/controllers/admin_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AdminContent extends StatefulWidget {
  const AdminContent({super.key});

  @override
  State<AdminContent> createState() => _AdminContentState();
}

class _AdminContentState extends State<AdminContent> {
  final adminContentController = AdminContentController();

  @override
  void initState() {
    super.initState();
    adminContentController.listarCandidatos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Admin Content'),
        ),
        body: Observer(
        builder: (_) {
            return ListView.builder(
                itemCount: adminContentController.candidatos.length,
                itemBuilder: (context, index) {
                  var candidato = adminContentController.candidatos[index];
                  return ListTile(
                    title: Text(candidato.nome),
                    subtitle: Text(candidato.email),
                    // Adicione mais informações se necessário
                  );
                });
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          adminContentController.listarCandidatos();
        },
        child: Icon(Icons.refresh),
      ),
    );}
}