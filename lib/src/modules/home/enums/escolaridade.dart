enum Escolaridade {
  ANALFABETO,
  FUNDAMENTAL_COMPLETO,
  MEDIO_INCOMPLETO,
  MEDIO_COMPLETO,
  SUPERIOR_INCOMPLETO,
  SUPERIOR_COMPLETO,
  MESTRADO,
  DOUTORADO,
  IGNORADO
}

extension EscolaridadeExtension on Escolaridade {
  String toValue() {
    switch (this) {
      case Escolaridade.ANALFABETO:
        return 'ANALFABETO';
      case Escolaridade.FUNDAMENTAL_COMPLETO:
        return 'FUNDAMENTAL_COMPLETO';
      case Escolaridade.MEDIO_INCOMPLETO:
        return 'MEDIO_INCOMPLETO';
      case Escolaridade.MEDIO_COMPLETO:
        return 'MEDIO_COMPLETO';
      case Escolaridade.SUPERIOR_INCOMPLETO:
        return 'SUPERIOR_INCOMPLETO';
      case Escolaridade.SUPERIOR_COMPLETO:
        return 'SUPERIOR_COMPLETO';
      case Escolaridade.MESTRADO:
        return 'MESTRADO';
      case Escolaridade.DOUTORADO:
        return 'DOUTORADO';
      case Escolaridade.IGNORADO:
        return 'IGNORADO';
    }
  }

  static Escolaridade fromValue(String value) {
    switch (value) {
      case 'ANALFABETO':
        return Escolaridade.ANALFABETO;
      case 'FUNDAMENTAL_COMPLETO':
        return Escolaridade.FUNDAMENTAL_COMPLETO;
      case 'MEDIO_INCOMPLETO':
        return Escolaridade.MEDIO_INCOMPLETO;
      case 'MEDIO_COMPLETO':
        return Escolaridade.MEDIO_COMPLETO;
      case 'SUPERIOR_INCOMPLETO':
        return Escolaridade.SUPERIOR_INCOMPLETO;
      case 'SUPERIOR_COMPLETO':
        return Escolaridade.SUPERIOR_COMPLETO;
      case 'MESTRADO':
        return Escolaridade.MESTRADO;
      case 'DOUTORADO':
        return Escolaridade.DOUTORADO;
      case 'IGNORADO':
        return Escolaridade.IGNORADO;
      default:
        throw ArgumentError('Valor não suportado: $value');
    }
  }
}
