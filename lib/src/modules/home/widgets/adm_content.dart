import 'package:curriculum_front/src/modules/auth/controllers/auth_controller/auth_controller.dart';
import 'package:curriculum_front/src/modules/auth/widget/observer_button.dart';
import 'package:curriculum_front/src/modules/home/controllers/admin_content_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdminContent extends StatefulWidget {
  const AdminContent({super.key});

  @override
  State<AdminContent> createState() => _AdminContentState();
}

class _AdminContentState extends State<AdminContent> {
  final adminContentController = AdminContentController();
  final authController = Modular.get<AuthController>();

  @override
  void initState() {
    super.initState();
    adminContentController.listarCandidatos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Observer(
          builder: (_) {
            if (adminContentController.candidatos.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("A lista de candidatos está vazia."),
                    ObserverButton(
                        onPressed: () async {
                          await authController.logout();
                        },
                        child: const Text("Sair"))
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: adminContentController.candidatos.length,
                itemBuilder: (context, index) {
                  var candidato = adminContentController.candidatos[index];

                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, right: 8, left: 8),
                    child: GestureDetector(
                      onTap: () {
                        // Lógica a ser executada quando o item for tocado
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(), // Adicione borda ou estilo desejado
                          borderRadius: BorderRadius.circular(
                              8), // Adicione bordas arredondadas se desejar
                        ),
                        child: ListTile(
                          title: Text(candidato.nome),
                          subtitle: Text(candidato.email),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                color: Colors.green[800],
                                icon: const Icon(Icons.check),
                                onPressed: () {
                                  adminContentController
                                      .aprovarCandidato(candidato.id);
                                },
                              ),
                              IconButton(
                                color: Colors.red[800],
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  adminContentController
                                      .reprovarCandidato(candidato.id);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                
                
              );
              
            }
          },
          
        ),
        
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            adminContentController.listarCandidatos(); // Atualiza a lista de candidatos
          },
          child: const Icon(Icons.refresh),
        )
      );
  }
}
