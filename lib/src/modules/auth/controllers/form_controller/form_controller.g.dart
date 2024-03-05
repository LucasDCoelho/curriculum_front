// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormController on _FormController, Store {
  Computed<String>? _$getLoginComputed;

  @override
  String get getLogin =>
      (_$getLoginComputed ??= Computed<String>(() => super.getLogin,
              name: '_FormController.getLogin'))
          .value;
  Computed<String>? _$getPasswordComputed;

  @override
  String get getPassword =>
      (_$getPasswordComputed ??= Computed<String>(() => super.getPassword,
              name: '_FormController.getPassword'))
          .value;

  late final _$loginAtom =
      Atom(name: '_FormController.login', context: context);

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormController.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$_FormControllerActionController =
      ActionController(name: '_FormController', context: context);

  @override
  dynamic setLogin(String value) {
    final _$actionInfo = _$_FormControllerActionController.startAction(
        name: '_FormController.setLogin');
    try {
      return super.setLogin(value);
    } finally {
      _$_FormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_FormControllerActionController.startAction(
        name: '_FormController.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
login: ${login},
password: ${password},
getLogin: ${getLogin},
getPassword: ${getPassword}
    ''';
  }
}
