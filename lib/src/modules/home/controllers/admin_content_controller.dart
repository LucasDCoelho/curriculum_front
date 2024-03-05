import 'package:curriculum_front/src/modules/auth/controllers/token_controller/token_controller.dart';
import 'package:curriculum_front/src/modules/home/dto/list_all_candidatos_DTO.dart';
import 'package:curriculum_front/src/modules/home/enums/situacao.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/service/dio_service.dart';

part 'admin_content_controller.g.dart';

class AdminContentController = _AdminContentController
    with _$AdminContentController;

abstract class _AdminContentController with Store {
  final _baseUrl = "http://192.168.100.21:8080";
  final _dioService = Modular.get<DioService>();
  final _token = Modular.get<TokenController>();

  @observable
  ObservableList<ListAllCandidatoDTO> candidatos =
      ObservableList<ListAllCandidatoDTO>();

  Future listarCandidatos() async {
    try {
      final token = await _token.getToken();

      final response = await _dioService.get(
          url: "$_baseUrl/candidato/list-all", token: token);
      print(response.data);

      if (response.statusCode == 200) {
        candidatos.clear();

        for (var candidatoData in response.data['content']) {
          candidatos.add(ListAllCandidatoDTO(
            id: candidatoData['id'],
            nome: candidatoData['nome'],
            cpf: candidatoData['cpf'],
            email: candidatoData['email'],
            telefone: candidatoData['telefone'],
            situacao: candidatoData['situacao'],
          ));
        }
      } else {
        print('Falha ao carregar candidatos: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao carregar candidatos: $e');
    }
  }


  Future aprovarCandidato(int id) async{
    final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${await _token.getToken()}'
    };
    try {
    final response = await _dioService.postCandidato(
      url:" $_baseUrl/candidato/${id.toString()}/approve", 
      headers: headers, data: {},
    );
    print(response.data); 
    await listarCandidatos();
  } catch (e) {
    print('Erro ao aprovar candidato: $e');
  }
  }


   Future reprovarCandidato(int id) async{
    final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${await _token.getToken()}'
    };
    try {
    final response = await _dioService.postCandidato(
      url:" $_baseUrl/candidato/${id.toString()}/reject", 
      headers: headers, data: {},
    );
    print(response.data); 
    await listarCandidatos();
  } catch (e) {
    print('Erro ao aprovar candidato: $e');
  }
  }
}
