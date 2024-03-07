import 'package:curriculum_front/src/modules/home/enums/situacao.dart';
import 'package:flutter/material.dart';

class BoxDecorationColorSwitch {
  static Color getColorBySituacao(Situacao? situacao) {
    switch (situacao) {
      case Situacao.AGUARDANDO:
        return Colors.grey; // Cor para AGUARDANDO
      case Situacao.APROVADO:
        return Colors.green; // Cor para APROVADO
      case Situacao.REPROVADO:
        return Colors.red; // Cor para REPROVADO
      default:
        return Colors.white; // Cor padrão
    }
  }
}