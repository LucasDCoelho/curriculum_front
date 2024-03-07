import 'package:curriculum_front/src/modules/auth/widget/observer_button.dart';
import 'package:curriculum_front/src/modules/auth/widget/observer_text_field.dart';
import 'package:curriculum_front/src/modules/home/controllers/candidato_form_controller/candidato_form_controller.dart';
import 'package:curriculum_front/src/modules/home/enums/escolaridade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormCandidato extends StatelessWidget {
  const FormCandidato({super.key});

  @override
  Widget build(BuildContext context) {
    final formCandidatoController = Modular.get<CandidatoFormController>();

    return ListView(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 12, right: 12),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: ObserverTextField(
                    labelText: "Nome",
                    hintText: "Digite seu nome!",
                    onChanged: formCandidatoController.setNome,
                    obscureText: false),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: ObserverTextField(
                    labelText: "CPF",
                    hintText: "Digite seu cpf!",
                    onChanged: formCandidatoController.setCpf,
                    obscureText: false),
              ),
              Observer(
                builder: (_) => Text(
                    "${formCandidatoController.getDataDeNascimento.day}/${formCandidatoController.getDataDeNascimento.month}/${formCandidatoController.getDataDeNascimento.year}"),
              ),
              Observer(
                builder: (_) => Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        
                        return await formCandidatoController
                            .selectDate(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                      child: const Text("Escolha a data do seu aniversario")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: ObserverTextField(
                    labelText: "Email",
                    hintText: "Digite seu email!",
                    onChanged: formCandidatoController.setEmail,
                    obscureText: false),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: ObserverTextField(
                    labelText: "Telefone",
                    hintText: "Digite seu telefone!",
                    onChanged: formCandidatoController.setTelefone,
                    obscureText: false),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Observer(
                  builder: (_) => DropdownButtonFormField<Escolaridade>(
                    value: formCandidatoController.escolaridade,
                    onChanged: (Escolaridade? value) {
                      formCandidatoController.setEscolaridade(value);
                    },
                    items: Escolaridade.values.map((escolaridade) {
                      return DropdownMenuItem<Escolaridade>(
                        value: escolaridade,
                        child: Text(escolaridade.toString().split('.').last),
                      );
                    }).toList(),
                    decoration:
                        const InputDecoration(labelText: 'Escolaridade'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: ObserverTextField(
                    labelText: "Função",
                    hintText: "Digite sua função!",
                    onChanged: formCandidatoController.setFuncao,
                    obscureText: false),
              ),
              Observer(
                builder: (_) => Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: formCandidatoController.competencias.length,
                      itemBuilder: (context, index) {
                        final competencia =
                            formCandidatoController.competencias[index];
                        return ListTile(
                          title: Text(competencia.descricao),
                          subtitle: Text(competencia.proficiencia.toString()),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => formCandidatoController
                                .removeCompetencia(competencia),
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async => await formCandidatoController
                          .adicionarCompetencia(context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                      child: const Text('Adicionar Competência'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ObserverButton(
                          onPressed: () async {
                            await formCandidatoController.enviarCandidato();
                            
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          child: const Text("Enviar")),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}