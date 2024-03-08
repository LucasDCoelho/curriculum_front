import 'package:curriculum_front/src/modules/home/utils/adm_content/first_letter_upper_case.dart';
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

Widget buildCompetenciaItem(List<Competencia> competencias) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: competencias.length,
    itemBuilder: (context, index) {
      final competencia = competencias[index];
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
              'Proficiência: ${firstLetterUpperCase(competencia.proficiencia.name)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    },
  );
}
