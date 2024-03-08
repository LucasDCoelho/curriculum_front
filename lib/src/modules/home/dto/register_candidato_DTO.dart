import 'dart:convert';
import 'package:curriculum_front/src/modules/home/enums/escolaridade.dart';
import 'package:curriculum_front/src/modules/home/model/competencia.dart';

class RegisterCandidatoDTO {
  final String nome;
  final String cpf;
  final DateTime dataDeNascimento;
  final String email;
  final String telefone;
  final Escolaridade escolaridade;
  final String funcao;
  final List<Competencia> competencias;

  RegisterCandidatoDTO({
    required this.nome,
    required this.cpf,
    required this.dataDeNascimento,
    required this.email,
    required this.telefone,
    required this.escolaridade,
    required this.funcao,
    required this.competencias,
  });

  factory RegisterCandidatoDTO.fromJson(String source) {
    final Map<String, dynamic> map = json.decode(source);
    return RegisterCandidatoDTO(
      nome: map['nome'],
      cpf: map['cpf'],
      dataDeNascimento: DateTime.parse(map['dataDeNascimento']),
      email: map['email'],
      telefone: map['telefone'],
      escolaridade: EscolaridadeExtension.fromValue(map['escolaridade']),
      funcao: map['funcao'],
      competencias: (map['competencias'] as List)
          .map((competencia) => Competencia.fromJson(competencia))
          .toList(),
    );
  }

  String toJson() {
    return json.encode({
      'nome': nome,
      'cpf': cpf,
      'dataDeNascimento': dataDeNascimento.toIso8601String(),
      'email': email,
      'telefone': telefone,
      'escolaridade': escolaridade.toValue(),
      'funcao': funcao,
      'competencias': competencias.map((competencia) => competencia.toJson()).toList(),
    });
  }
}

