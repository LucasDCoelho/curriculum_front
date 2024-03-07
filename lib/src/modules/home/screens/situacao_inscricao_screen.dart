import 'package:curriculum_front/src/modules/home/controllers/admin_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SituacaoInscricao extends StatefulWidget {
  const SituacaoInscricao({super.key});

  @override
  State<SituacaoInscricao> createState() => _SituacaoInscricaoState();
}

class _SituacaoInscricaoState extends State<SituacaoInscricao> {
  final adminController = Modular.get<AdminContentController>();
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await adminController.listarCandidatos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Situação da Inscrição'),
         actions: [
          IconButton(
            onPressed: () async{
              await adminController.listarCandidatos();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],

      ),
      body: Observer(
        builder: (_) {
          if (adminController.candidatos.isEmpty) {
            return const Text('Nenhum candidato encontrado.');
          }
      
          return ListView.builder(
            shrinkWrap: true,
            itemCount: adminController.candidatos.length,
            itemBuilder: (context, index) {
              final candidato = adminController.candidatos.elementAt(index);
              return ListTile(
                title: Text(candidato.nome),
                subtitle: Text(candidato.situacao.toString()),
                trailing: Text(candidato.id.toString()),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed("./register");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
