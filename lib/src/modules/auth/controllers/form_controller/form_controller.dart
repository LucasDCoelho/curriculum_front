import 'package:mobx/mobx.dart';

part 'form_controller.g.dart';

class FormController = _FormController with _$FormController;

abstract class _FormController with Store {
  @observable
  String login = "";
  @action
  setLogin(String value) => login = value;

  @observable
  String password = "";
  @action
  setPassword(String value) => password = value;
  
  @computed
  String get getLogin => login;

  @computed
  String get getPassword => password;

}