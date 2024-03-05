// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidato_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CandidatoFormController on _CandidatoFormController, Store {
  Computed<DateTime>? _$getDataDeNascimentoComputed;

  @override
  DateTime get getDataDeNascimento => (_$getDataDeNascimentoComputed ??=
          Computed<DateTime>(() => super.getDataDeNascimento,
              name: '_CandidatoFormController.getDataDeNascimento'))
      .value;

  late final _$nomeAtom =
      Atom(name: '_CandidatoFormController.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$cpfAtom =
      Atom(name: '_CandidatoFormController.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$dataDeNascimentoAtom =
      Atom(name: '_CandidatoFormController.dataDeNascimento', context: context);

  @override
  DateTime get dataDeNascimento {
    _$dataDeNascimentoAtom.reportRead();
    return super.dataDeNascimento;
  }

  @override
  set dataDeNascimento(DateTime value) {
    _$dataDeNascimentoAtom.reportWrite(value, super.dataDeNascimento, () {
      super.dataDeNascimento = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_CandidatoFormController.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$telefoneAtom =
      Atom(name: '_CandidatoFormController.telefone', context: context);

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  late final _$escolaridadeAtom =
      Atom(name: '_CandidatoFormController.escolaridade', context: context);

  @override
  Escolaridade get escolaridade {
    _$escolaridadeAtom.reportRead();
    return super.escolaridade;
  }

  @override
  set escolaridade(Escolaridade value) {
    _$escolaridadeAtom.reportWrite(value, super.escolaridade, () {
      super.escolaridade = value;
    });
  }

  late final _$funcaoAtom =
      Atom(name: '_CandidatoFormController.funcao', context: context);

  @override
  String get funcao {
    _$funcaoAtom.reportRead();
    return super.funcao;
  }

  @override
  set funcao(String value) {
    _$funcaoAtom.reportWrite(value, super.funcao, () {
      super.funcao = value;
    });
  }

  late final _$proficienciaAtom =
      Atom(name: '_CandidatoFormController.proficiencia', context: context);

  @override
  Proficiencia get proficiencia {
    _$proficienciaAtom.reportRead();
    return super.proficiencia;
  }

  @override
  set proficiencia(Proficiencia value) {
    _$proficienciaAtom.reportWrite(value, super.proficiencia, () {
      super.proficiencia = value;
    });
  }

  late final _$competenciasAtom =
      Atom(name: '_CandidatoFormController.competencias', context: context);

  @override
  ObservableList<Competencia> get competencias {
    _$competenciasAtom.reportRead();
    return super.competencias;
  }

  @override
  set competencias(ObservableList<Competencia> value) {
    _$competenciasAtom.reportWrite(value, super.competencias, () {
      super.competencias = value;
    });
  }

  late final _$adicionarCompetenciaAsyncAction = AsyncAction(
      '_CandidatoFormController.adicionarCompetencia',
      context: context);

  @override
  Future<dynamic> adicionarCompetencia(BuildContext context) {
    return _$adicionarCompetenciaAsyncAction
        .run(() => super.adicionarCompetencia(context));
  }

  late final _$selectDateAsyncAction =
      AsyncAction('_CandidatoFormController.selectDate', context: context);

  @override
  Future<dynamic> selectDate(BuildContext context) {
    return _$selectDateAsyncAction.run(() => super.selectDate(context));
  }

  late final _$_CandidatoFormControllerActionController =
      ActionController(name: '_CandidatoFormController', context: context);

  @override
  void setNome(String value) {
    final _$actionInfo = _$_CandidatoFormControllerActionController.startAction(
        name: '_CandidatoFormController.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_CandidatoFormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo = _$_CandidatoFormControllerActionController.startAction(
        name: '_CandidatoFormController.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_CandidatoFormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_CandidatoFormControllerActionController.startAction(
        name: '_CandidatoFormController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CandidatoFormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String value) {
    final _$actionInfo = _$_CandidatoFormControllerActionController.startAction(
        name: '_CandidatoFormController.setTelefone');
    try {
      return super.setTelefone(value);
    } finally {
      _$_CandidatoFormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEscolaridade(Escolaridade? value) {
    final _$actionInfo = _$_CandidatoFormControllerActionController.startAction(
        name: '_CandidatoFormController.setEscolaridade');
    try {
      return super.setEscolaridade(value);
    } finally {
      _$_CandidatoFormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuncao(String value) {
    final _$actionInfo = _$_CandidatoFormControllerActionController.startAction(
        name: '_CandidatoFormController.setFuncao');
    try {
      return super.setFuncao(value);
    } finally {
      _$_CandidatoFormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCompetencia(Competencia competencia) {
    final _$actionInfo = _$_CandidatoFormControllerActionController.startAction(
        name: '_CandidatoFormController.addCompetencia');
    try {
      return super.addCompetencia(competencia);
    } finally {
      _$_CandidatoFormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCompetencia(Competencia competencia) {
    final _$actionInfo = _$_CandidatoFormControllerActionController.startAction(
        name: '_CandidatoFormController.removeCompetencia');
    try {
      return super.removeCompetencia(competencia);
    } finally {
      _$_CandidatoFormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProficiencia(Proficiencia? value) {
    final _$actionInfo = _$_CandidatoFormControllerActionController.startAction(
        name: '_CandidatoFormController.setProficiencia');
    try {
      return super.setProficiencia(value);
    } finally {
      _$_CandidatoFormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataDeNascimento(DateTime value) {
    final _$actionInfo = _$_CandidatoFormControllerActionController.startAction(
        name: '_CandidatoFormController.setDataDeNascimento');
    try {
      return super.setDataDeNascimento(value);
    } finally {
      _$_CandidatoFormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
cpf: ${cpf},
dataDeNascimento: ${dataDeNascimento},
email: ${email},
telefone: ${telefone},
escolaridade: ${escolaridade},
funcao: ${funcao},
proficiencia: ${proficiencia},
competencias: ${competencias},
getDataDeNascimento: ${getDataDeNascimento}
    ''';
  }
}
