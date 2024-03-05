enum Situacao {
  AGUARDANDO,
  APROVADO,
  REPROVADO
}

extension SituacaoExtension on Situacao {
  String toMap() {
    return toString().split('.').last;
  }

  static Situacao fromMap(String value) {
    switch (value) {
      case 'AGUARDANDO':
        return Situacao.AGUARDANDO;
      case 'APROVADO':
        return Situacao.APROVADO;
      case 'REPROVADO':
        return Situacao.REPROVADO;
      default:
        throw ArgumentError('Valor desconhecido para Situacao: $value');
    }
  }
}