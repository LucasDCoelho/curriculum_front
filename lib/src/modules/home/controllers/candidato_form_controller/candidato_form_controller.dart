import 'package:curriculum_front/src/core/service/dio_service.dart';
import 'package:curriculum_front/src/modules/auth/controllers/token_controller/token_controller.dart';
import 'package:curriculum_front/src/modules/home/enums/escolaridade.dart';
import 'package:curriculum_front/src/modules/home/enums/proficiencia.dart';
import 'package:curriculum_front/src/modules/home/dto/register_candidato_dto.dart';
import 'package:curriculum_front/src/modules/home/model/competencia.dart';
import 'package:curriculum_front/src/modules/home/widgets/add_competencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'candidato_form_controller.g.dart';

class CandidatoFormController = _CandidatoFormController
    with _$CandidatoFormController;

abstract class _CandidatoFormController with Store {
  final DioService _dioService = Modular.get<DioService>();
  final token = Modular.get<TokenController>();

  @observable
  String nome = '';

  @observable
  String cpf = '';

  @observable
  DateTime dataDeNascimento = DateTime.now();

  @observable
  String email = '';

  @observable
  String telefone = '';

  @observable
  Escolaridade escolaridade = Escolaridade.ANALFABETO;

  @observable
  String funcao = '';

  @observable
  Proficiencia proficiencia = Proficiencia.basico;

  @action
  void setNome(String value) => nome = value;

  @action
  void setCpf(String value) => cpf = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setTelefone(String value) => telefone = value;

  @action
  void setEscolaridade(Escolaridade? value) {
    if (value != null) {
      escolaridade = value;
    }
  }

  @action
  void setFuncao(String value) => funcao = value;

  //Competecias State:

  @observable
  ObservableList<Competencia> competencias = ObservableList<Competencia>();

  @action
  void addCompetencia(Competencia competencia) => competencias.add(competencia);

  @action
  void removeCompetencia(Competencia competencia) =>
      competencias.remove(competencia);

  @action
  void setProficiencia(Proficiencia? value) {
    if (value != null) {
      proficiencia = value;
    }
  }

  @action
  Future adicionarCompetencia(BuildContext context) async {
    await showDialog<String>(
      context: context,
      builder: (_) => AdicionarCompetenciaDialog(
        addCompetencia: (Competencia novaCompetencia) {
          addCompetencia(novaCompetencia);
        },
      ),
    );
  }

  // Data de nascimento state:

  @action
  void setDataDeNascimento(DateTime value) => dataDeNascimento = value;

  @computed
  DateTime get getDataDeNascimento => dataDeNascimento;

  @action
  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: getDataDeNascimento,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    print(picked);

    if (picked != null && picked != getDataDeNascimento) {
      // Atualize o estado no store
      setDataDeNascimento(picked);
    }
  }

  //  Enviar fomulario do candidato:

  Future enviarCandidato() async {
    

    print("Teste");
    final candidato = RegisterCandidatoDTO(
      nome: nome,
      cpf: cpf,
      dataDeNascimento: dataDeNascimento,
      email: email,
      telefone: telefone,
      escolaridade: escolaridade,
      funcao: funcao,
      competencias: competencias.toList(),
    );

    const urlBase = 'https://api-curriculum.onrender.com/candidato/create';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await token.getToken()}'
    };
    final body = candidato.toJson();
    print(body);

    try {
      final response = await _dioService.postCandidato(
        url: urlBase,
        headers: headers,
        data: body,
      );

      if (response.statusCode == 201) {
        // Sucesso ao enviar o candidato
        print('Candidato enviado com sucesso!');
        Modular.to.pop();
      } else {
        // Falha ao enviar o candidato
        print('Falha ao enviar o candidato: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao enviar o candidato: $e');
    }
  }
}
