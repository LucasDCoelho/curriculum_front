import 'package:curriculum_front/src/modules/home/enums/proficiencia.dart';

class Competencia {
  int? id;
  String descricao;
  Proficiencia proficiencia;

  Competencia({ required this.descricao, required this.proficiencia, this.id});

  factory Competencia.fromJson(Map<String, dynamic> json) {
    return Competencia(
      id: json['id'],
      descricao: json['descricao'] as String,
      proficiencia: ProficienciaExtension.fromValue(json['proficiencia'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'descricao': descricao,
      'proficiencia': proficiencia.toValue(),
    };
  }
}