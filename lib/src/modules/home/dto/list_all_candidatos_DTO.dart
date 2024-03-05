// ignore_for_file: public_member_api_docs, sort_constructors_first


class ListAllCandidatoDTO {
  final int id;
  final String nome;
  final String cpf;
  final String email;
  final String telefone;
  final String situacao;
  ListAllCandidatoDTO({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.telefone,
    required this.situacao,
  });
}