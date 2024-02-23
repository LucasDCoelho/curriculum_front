// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TokenController on _TokenController, Store {
  late final _$tokenAtom =
      Atom(name: '_TokenController.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  bool _tokenIsInitialized = false;

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, _tokenIsInitialized ? super.token : null,
        () {
      super.token = value;
      _tokenIsInitialized = true;
    });
  }

  late final _$saveTokenAsyncAction =
      AsyncAction('_TokenController.saveToken', context: context);

  @override
  Future<dynamic> saveToken(String value) {
    return _$saveTokenAsyncAction.run(() => super.saveToken(value));
  }

  late final _$clearTokenAsyncAction =
      AsyncAction('_TokenController.clearToken', context: context);

  @override
  Future<dynamic> clearToken() {
    return _$clearTokenAsyncAction.run(() => super.clearToken());
  }

  late final _$isGetTokenAsyncAction =
      AsyncAction('_TokenController.isGetToken', context: context);

  @override
  Future<bool> isGetToken() {
    return _$isGetTokenAsyncAction.run(() => super.isGetToken());
  }

  late final _$getTokenAsyncAction =
      AsyncAction('_TokenController.getToken', context: context);

  @override
  Future<String?> getToken() {
    return _$getTokenAsyncAction.run(() => super.getToken());
  }

  @override
  String toString() {
    return '''
token: ${token}
    ''';
  }
}
