enum Proficiencia {
  basico,
  intermediario,
  avancado
}

extension ProficienciaExtension on Proficiencia {
  String toValue() {
    switch (this) {
      case Proficiencia.basico:
        return 'BASICO';
      case Proficiencia.intermediario:
        return 'INTERMEDIARIO';
      case Proficiencia.avancado:
        return 'AVANCADO';
    }
  }

  static Proficiencia fromString(String value) {
    switch (value) {
      case 'BASICO':
        return Proficiencia.basico;
      case 'INTERMEDIARIO':
        return Proficiencia.intermediario;
      case 'AVANCADO':
        return Proficiencia.avancado;
      default:
        throw Exception('Valor de proficiencia inválido: $value');
    }
  }
}