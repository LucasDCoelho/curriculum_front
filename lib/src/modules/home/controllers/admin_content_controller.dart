import 'package:curriculum_front/src/modules/auth/controllers/token_controller/token_controller.dart';
import 'package:curriculum_front/src/modules/home/dto/details_candidato_dto.dart';
import 'package:curriculum_front/src/modules/home/dto/list_all_candidatos_dto.dart';
import 'package:curriculum_front/src/modules/home/model/candidato.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/service/dio_service.dart';

part 'admin_content_controller.g.dart';

class AdminContentController = _AdminContentController
    with _$AdminContentController;

abstract class _AdminContentController with Store {
  final _baseUrl = "http://192.168.100.21:8080";
  // final _baseUrl = "https://api-curriculum.onrender.com";
  final _dioService = Modular.get<DioService>();
  final _token = Modular.get<TokenController>();

  @observable
  ObservableList<ListAllCandidatoDTO> candidatos =
      ObservableList<ListAllCandidatoDTO>();

  @observable
  DetailsCandidatoDTO? candidato;

  Future listarCandidatos() async {
    try {
      final token = await _token.getToken();

      final response = await _dioService.get(
          url: "$_baseUrl/candidato/list-all", token: token);

      if (response.statusCode == 200) {
        candidatos.clear();
        for (var candidatoData in response.data["content"]) {
          candidatos.add(ListAllCandidatoDTO.fromJson(candidatoData));
        }
      } else {
        print('Falha ao carregar candidatos: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao carregar candidatos: $e');
    }
  }

  @observable
  ObservableList<Candidato> candidatosFiltrados = ObservableList<Candidato>();

  Future listarCandidatosPorId() async {
    try {
      final token = await _token.getToken();

      final response = await _dioService.get(
          url: "$_baseUrl/candidato/list-all-by-id", token: token);
      print(response.data);

      if (response.statusCode == 200) {
        candidatosFiltrados.clear();

        for (var candidatoData in response.data) {
          candidatosFiltrados.add(Candidato.fromJson(candidatoData));
        }
      } else {
        print('Falha ao carregar candidatos: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao carregar candidatos: $e');
    }
  }

  @computed
  Iterable<ListAllCandidatoDTO> get listaFiltrado => candidatos.where((e) {
        print(_token.getTokenId);
        print(e.id);
        return e.id == _token.getTokenId;
      });

  Future aprovarCandidato(int? id) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _token.getToken()}'
    };
    try {
      final response = await _dioService.postCandidato(
          url: "$_baseUrl/candidato/$id/approve", headers: headers);
      print(response.data);
      await listarCandidatos();
    } catch (e) {
      print('Erro ao aprovar candidato: $e');
    }
  }

  Future reprovarCandidato(int? id) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _token.getToken()}'
    };
    try {
      final response = await _dioService.postCandidato(
        url: "$_baseUrl/candidato/$id/reject",
        headers: headers,
        data: {'situacao': 'REPROVADO'},
      );
      print(response.data);
      await listarCandidatos();
    } catch (e) {
      print('Erro ao aprovar candidato: $e');
    }
  }

  Future detalharCandidato(int? id) async {
    try {
      final response = await _dioService.get(
          url: '$_baseUrl/candidato/$id', token: await _token.getToken());

      if (response.statusCode == 200) {
        final responseData = DetailsCandidatoDTO.fromJson(response.data);
        Modular.to.pushNamed("./details", arguments: responseData);
      } else {
        print(
            'Erro ao buscar detalhes do candidato codigo: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Erro ao buscar detalhes do candidato: $e');
      return null;
    }
  }
}
