import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:curriculum_front/src/modules/home/enums/proficiencia.dart';
import 'package:curriculum_front/src/modules/home/model/competencia.dart';

class AdicionarCompetenciaDialog extends StatelessWidget {
  final Function(Competencia) addCompetencia;

  const AdicionarCompetenciaDialog({Key? key, required this.addCompetencia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final descricaoController = TextEditingController();
    Proficiencia? proficiencia;

    void setProficiencia(Proficiencia? value) {
      proficiencia = value;
    }

    return AlertDialog(
      title: const Text('Adicionar Competência'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              Observer(
                builder: (_) => DropdownButtonFormField<Proficiencia>(
                  value: proficiencia,
                  onChanged: setProficiencia,
                  items: Proficiencia.values.map((proficiencia) {
                    return DropdownMenuItem<Proficiencia>(
                      value: proficiencia,
                      child: Text(proficiencia.toString().split('.').last),
                    );
                  }).toList(),
                  decoration: const InputDecoration(labelText: 'Proficiencia'),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            final descricao = descricaoController.text;
            if (descricao.isNotEmpty && proficiencia != null) {
              final novaCompetencia = Competencia(
                descricao: descricao,
                proficiencia: proficiencia!,
              );
              addCompetencia(novaCompetencia);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}
