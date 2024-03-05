import 'dart:convert';

import 'package:curriculum_front/src/modules/home/enums/escolaridade.dart';
import 'package:curriculum_front/src/modules/home/model/competencia.dart';
import 'package:intl/intl.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'cpf': cpf,
      'dataDeNascimento': DateFormat("yyyy-MM-dd").format(dataDeNascimento),
      'email': email,
      'telefone': telefone,
      'escolaridade': escolaridade.toValue(),
      'funcao': funcao,
      'competencias': competencias.map((competencia) => competencia.toJson()).toList(),
    };
  }

  factory RegisterCandidatoDTO.fromJson(String source) {
    final Map<String, dynamic> map = json.decode(source);
    return RegisterCandidatoDTO(
      nome: map['nome'],
      cpf: map['cpf'],
      dataDeNascimento: DateTime.fromMillisecondsSinceEpoch(map['dataDeNascimento']),
      email: map['email'],
      telefone: map['telefone'],
      escolaridade: EscolaridadeExtension.fromValue(map['escolaridade']),
      funcao: map['funcao'],
      competencias: (map['competencias'] as List).map((competencia) => Competencia.fromJson(competencia)).toList(),
    );
  }

  @override
  String toString() {
    return 'RegisterCandidatoDTO(nome: $nome, cpf: $cpf, dataDeNascimento: $dataDeNascimento, email: $email, telefone: $telefone, escolaridade: $escolaridade, funcao: $funcao, competencias: $competencias)';
  }

  @override
  bool operator ==(covariant RegisterCandidatoDTO other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.cpf == cpf &&
        other.dataDeNascimento == dataDeNascimento &&
        other.email == email &&
        other.telefone == telefone &&
        other.escolaridade == escolaridade &&
        other.funcao == funcao &&
        other.competencias == competencias;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        cpf.hashCode ^
        dataDeNascimento.hashCode ^
        email.hashCode ^
        telefone.hashCode ^
        escolaridade.hashCode ^
        funcao.hashCode ^
        competencias.hashCode;
  }
}
