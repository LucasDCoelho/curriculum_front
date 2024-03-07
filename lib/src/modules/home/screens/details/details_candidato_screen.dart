import 'package:curriculum_front/src/modules/home/dto/details_candidato_dto.dart';
import 'package:curriculum_front/src/modules/home/screens/details/details_candidato_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailsCandidatoDTO candidato = Modular.args.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Candidato'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetailRow('Nome:', candidato.nome),
              buildDetailRow('CPF:', candidato.cpf),
              buildDetailRow('Data de Nascimento:',
                  candidato.dataDeNascimento.toLocal().toString()),
              buildDetailRow('Email:', candidato.email),
              buildDetailRow('Telefone:', candidato.telefone),
              buildDetailRow('Escolaridade:', candidato.escolaridade.name),
              buildDetailRow('Função:', candidato.funcao),
              const Text(
                'Competências:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              if (candidato.competencias.isEmpty)
                for (var competencia in candidato.competencias)
                  buildCompetenciaItem(competencia),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          // Ação do botão 1
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Editar'),
                      ),
                    ),
                    const SizedBox(width: 16.0), // Espaçamento entre botões
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          // Ação do botão 1
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Remover'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}