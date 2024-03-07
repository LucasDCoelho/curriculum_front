import 'package:flutter/material.dart';
import 'package:curriculum_front/src/modules/home/model/competencia.dart';

Widget buildDetailRow(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label),
      Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
    ],
  );
}

Widget buildCompetenciaItem(Competencia competencia) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descrição: ${competencia.descricao}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Proficiência: ${competencia.proficiencia}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}