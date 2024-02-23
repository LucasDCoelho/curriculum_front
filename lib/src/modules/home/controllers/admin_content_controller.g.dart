// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_content_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdminContentController on _AdminContentController, Store {
  late final _$candidatosAtom =
      Atom(name: '_AdminContentController.candidatos', context: context);

  @override
  ObservableList<Candidato> get candidatos {
    _$candidatosAtom.reportRead();
    return super.candidatos;
  }

  @override
  set candidatos(ObservableList<Candidato> value) {
    _$candidatosAtom.reportWrite(value, super.candidatos, () {
      super.candidatos = value;
    });
  }

  @override
  String toString() {
    return '''
candidatos: ${candidatos}
    ''';
  }
}
