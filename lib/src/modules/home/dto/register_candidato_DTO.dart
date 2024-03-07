import 'dart:convert';
import 'package:curriculum_front/src/modules/home/enums/escolaridade.dart';
import 'package:curriculum_front/src/modules/home/model/candidato.dart';
import 'package:curriculum_front/src/modules/home/model/competencia.dart';

class RegisterCandidatoDTO extends Candidato {
  RegisterCandidatoDTO({
    required String nome,
    required String cpf,
    required DateTime dataDeNascimento,
    required String email,
    required String telefone,
    required Escolaridade escolaridade,
    required String funcao,
    required List<Competencia> competencias,
  }) : super(
          nome: nome,
          cpf: cpf,
          dataDeNascimento: dataDeNascimento,
          email: email,
          telefone: telefone,
          escolaridade: escolaridade,
          funcao: funcao,
          competencias: competencias,
        );

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
      competencias: (map['competencias'] as List).map((competencia) => Competencia.fromJson(competencia)).toList(),
    );
  }

  @override
  String toJson() {
    return json.encode(super.toMap());
  }
}
