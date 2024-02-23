import 'package:curriculum_front/src/modules/auth/controllers/token_controller/token_controller.dart';
import 'package:curriculum_front/src/modules/home/model/candidato.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/service/dio_service.dart';

part 'admin_content_controller.g.dart';

class AdminContentController = _AdminContentController with _$AdminContentController;

abstract class _AdminContentController with Store{
  final _baseUrl = "http://192.168.100.10:8080";
  final _dioService = Modular.get<DioService>();
  final _token = Modular.get<TokenController>();

  @observable
  ObservableList<Candidato> candidatos = ObservableList<Candidato>();


  Future listarCandidatos() async{
    try{
      final token = await _token.getToken();

      print(token);
     final response = await _dioService.get(url: "$_baseUrl/candidato/list-all", token: token);

     candidatos.clear();

     final List<dynamic> candidatosJson = response.data;
     for (var candidatoJson in candidatosJson) {
       candidatos.add(
         Candidato(
           nome: candidatoJson['name'],
           cpf: candidatoJson['cpf'],
           dataDeNascimento: candidatoJson['datadenascimento'],
           email: candidatoJson['email'],
           funcao: candidatoJson['funcao'],
           telefone: candidatoJson['telefone']
         ),
       );
     }
    }catch(e){
      rethrow;
    }
  }

}