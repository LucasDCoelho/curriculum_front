import 'package:curriculum_front/src/modules/home/model/competencia.dart';
import 'package:intl/intl.dart';

class Candidato {
  int id;
  String nome;
  String cpf;
  DateTime dataDeNascimento;
  String email;
  String telefone;
  String escolaridade;
  String funcao;
  List<Competencia> competencias;
  bool ativo;
  String situacao;

  Candidato({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.dataDeNascimento,
    required this.email,
    required this.telefone,
    required this.escolaridade,
    required this.funcao,
    required this.competencias,
    required this.ativo,
    required this.situacao,
  });

  factory Candidato.fromJson(Map<String, dynamic> json) {
    List<dynamic> competenciasData = json['competencias'];
    List<Competencia> competencias = competenciasData
        .map((competencia) => Competencia.fromJson(competencia))
        .toList();

    return Candidato(
      id: json['id'] as int,
      nome: json['nome'] as String,
      cpf: json['cpf'] as String,
      dataDeNascimento: DateFormat('yyyy-MM-dd').parse(json['dataDeNascimento'] as String),
      email: json['email'] as String,
      telefone: json['telefone'] as String,
      escolaridade: json['escolaridade'] as String,
      funcao: json['funcao'] as String,
      competencias: competencias,
      ativo: json['ativo'] as bool,
      situacao: json['situacao'] as String,
    );
  }
}