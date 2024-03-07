import 'package:curriculum_front/src/modules/home/enums/situacao.dart';

class ListAllCandidatoDTO {
  final int id;
  final String nome;
  final String cpf;
  final String email;
  final String telefone;
  final Situacao situacao;

  ListAllCandidatoDTO({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.telefone,
    required this.situacao,
  });

  factory ListAllCandidatoDTO.fromJson(Map<String, dynamic> json) {

    return ListAllCandidatoDTO(
      id: json['id'] as int,
      nome: json['nome'] as String,
      cpf: json['cpf'] as String,
      email: json['email'] as String,
      telefone: json['telefone'] as String,
      situacao: SituacaoExtension.fromMap(json['situacao']),
    );
  }
}