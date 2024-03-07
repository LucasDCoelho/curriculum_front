import 'package:curriculum_front/src/modules/home/enums/escolaridade.dart';
import 'package:curriculum_front/src/modules/home/model/competencia.dart';

class DetailsCandidatoDTO {
  final int id;
  final String nome;
  final String cpf;
  final String email;
  final String telefone;
  final DateTime dataDeNascimento;
  final Escolaridade escolaridade;
  final String funcao;
  final List<Competencia> competencias;

  DetailsCandidatoDTO({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.telefone,
    required this.dataDeNascimento,
    required this.escolaridade,
    required this.funcao,
    required this.competencias,
  });

  factory DetailsCandidatoDTO.fromJson(Map<String, dynamic> json) {
    return DetailsCandidatoDTO(
      id: json['id'] as int,
      nome: json['nome'] as String,
      cpf: json['cpf'] as String,
      email: json['email'] as String,
      telefone: json['telefone'] as String,
      dataDeNascimento: DateTime.parse(json['dataDeNascimento'] as String),
      escolaridade: EscolaridadeExtension.fromValue(json['escolaridade']),
      funcao: json['funcao'] as String,
      competencias: (json['competencias'] as List).map((competenciaJson) {
        if (competenciaJson is Map<String, dynamic>) {
          return Competencia.fromJson(competenciaJson);
        } else {
          throw Exception("Invalid competency data format in JSON");
        }
      }).toList(),
    );
  }
}
