import 'dart:convert';

import 'package:curriculum_front/src/modules/home/enums/proficiencia.dart';

class Competencia {
  late String descricao;
  late Proficiencia proficiencia;

  Competencia({required this.descricao, required this.proficiencia});

  Map<String, dynamic> toJson() {
    return {
      'descricao': descricao,
      'proficiencia': proficiencia.toValue(),
    };
  }

  factory Competencia.fromJson(String source) =>
      Competencia.fromMap(json.decode(source));

  factory Competencia.fromMap(Map<String, dynamic> map) {
    return Competencia(
      descricao: map['descricao'],
      proficiencia: ProficienciaExtension.fromString(map['proficiencia']),
    );
  }
}