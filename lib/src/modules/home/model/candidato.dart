// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:curriculum_front/src/modules/home/enums/escolaridade.dart';
import 'package:curriculum_front/src/modules/home/enums/situacao.dart';
import 'package:curriculum_front/src/modules/home/model/competencia.dart';
import 'package:intl/intl.dart';

class Candidato {
  int? id;
  String nome;
  String cpf;
  DateTime? dataDeNascimento;
  String email;
  String telefone;
  Escolaridade? escolaridade;
  String? funcao;
  List<Competencia>? competencias;
  bool? ativo;
  Situacao? situacao;
  Candidato({
    this.id,
    required this.nome,
    required this.cpf,
    required this.dataDeNascimento,
    required this.email,
    required this.telefone,
    required this.escolaridade,
    required this.funcao,
    required this.competencias,
    this.ativo,
    this.situacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'dataDeNascimento': DateFormat("yyyy-MM-dd").format(dataDeNascimento!),
      'email': email,
      'telefone': telefone,
      'escolaridade': escolaridade?.toValue(),
      'funcao': funcao,
      'competencias': competencias?.map((x) => x.toJson()).toList(),
      'ativo': ativo,
      'situacao': situacao?.toMap(),
    };
  }

  factory Candidato.fromMap(Map<String, dynamic> map) {
    return Candidato(
      id: map['id'] != null ? map['id'] as int : null,
      nome: map['nome'] as String,
      cpf: map['cpf'] as String,
      dataDeNascimento: DateTime.fromMillisecondsSinceEpoch(map['dataDeNascimento'] as int),
      email: map['email'] as String,
      telefone: map['telefone'] as String,
      escolaridade: EscolaridadeExtension.fromValue(map['escolaridade'] as String),
      funcao: map['funcao'] as String,
      competencias: List<Competencia>.from((map['competencias'] as List<int>).map<Competencia>((x) => Competencia.fromJson(x as Map<String,dynamic>),),),
      ativo: map['ativo'] != null ? map['ativo'] as bool : null,
      situacao: map['situacao'] != null ? SituacaoExtension.fromMap(map['situacao'] as String) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Candidato.fromJson(String source) => Candidato.fromMap(json.decode(source) as Map<String, dynamic>);

}
