// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:curriculum_front/src/modules/auth/enums/user_role.dart';
import 'package:curriculum_front/src/modules/home/model/candidato.dart';

class User {
  int? id;
  String login;
  String? password;
  UserRole? role;
  Set<Candidato>? candidatos;
  User({
    this.id,
    required this.login,
    this.password,
    this.candidatos,
  });

  User copyWith({
    int? id,
    String? login,
    String? password,
    Set<Candidato>? candidatos,
  }) {
    return User(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'login': login,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      login: map['login'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
