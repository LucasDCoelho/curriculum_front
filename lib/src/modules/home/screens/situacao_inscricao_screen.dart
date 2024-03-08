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
      await adminController.listarCandidatosPorId();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Situação da Inscrição'),
        actions: [
          IconButton(
            onPressed: () async {
              await adminController.listarCandidatosPorId();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (adminController.candidatosFiltrados.isEmpty) {
            return const Center(child: Text('Nenhum candidato encontrado.'));
          }

          return ListView.builder(
  shrinkWrap: true,
  itemCount: adminController.candidatosFiltrados.length,
  itemBuilder: (context, index) {
    final candidato = adminController.candidatosFiltrados.elementAt(index);
    
    Color? corFundo;
    Color corTexto;
    
    switch (candidato.situacao) {
      case 'AGUARDANDO':
        corFundo = Colors.grey[800];
        corTexto = Colors.white;
        break;
      case 'APROVADO':
        corFundo = Colors.green;
        corTexto = Colors.white;
        break;
      case 'REPROVADO':
        corFundo = Colors.red;
        corTexto = Colors.white;
        break;
      default:
        corFundo = Colors.transparent;
        corTexto = Colors.black;
    }
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
        onTap: () async {
          await adminController.detalharCandidato(candidato.id);
        },
        child: Container(
          color: corFundo,
          child: ListTile(
            title: Text(
              candidato.nome,
              style: TextStyle(color: corTexto),
            ),
            subtitle: Text(
              candidato.situacao,
              style: TextStyle(color: corTexto),
            ),
            trailing: Icon(
              Icons.navigate_next,
              color: corTexto,
            ),
          ),
        ),
      ),
    );
  },
);

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed("./register");
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
