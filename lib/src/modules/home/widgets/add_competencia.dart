import 'package:curriculum_front/src/modules/auth/widget/observer_text_field.dart';
import 'package:curriculum_front/src/modules/home/controllers/candidato_form_controller/candidato_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:curriculum_front/src/modules/home/enums/proficiencia.dart';
import 'package:curriculum_front/src/modules/home/model/competencia.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdicionarCompetenciaDialog extends StatelessWidget {
  final Function(Competencia) addCompetencia;

  const AdicionarCompetenciaDialog({Key? key, required this.addCompetencia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final candidatoFormController = Modular.get<CandidatoFormController>();

    return AlertDialog(
      title: const Text('Adicionar Competência'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ObserverTextField(
                onChanged: candidatoFormController.setDescricao,
                labelText: 'Descrição',
                hintText: '',
                obscureText: false,
              ),
              Observer(
                builder: (_) => DropdownButtonFormField<Proficiencia>(
                  value: candidatoFormController.proficiencia,
                  onChanged: candidatoFormController.setProficiencia,
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
            final descricao = candidatoFormController.descricao;
            final proficiencia = candidatoFormController.proficiencia;
            if (descricao.isNotEmpty && proficiencia.name.isNotEmpty) {
              final novaCompetencia = Competencia(
                descricao: descricao,
                proficiencia: proficiencia,
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
