import 'dart:convert';

import 'package:dart_desafio_final/estado.dart';

class Cidade {
  int id;
  String nome;
  Estado estado;
  Cidade({
    required this.id,
    required this.nome,
    required this.estado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'estado': estado.toMap(),
    };
  }

  factory Cidade.fromMap(Map map) {
    return Cidade(
      id: map['id'] ?? map[0] ?? -1,
      nome: map['nome'] ?? map[2] ?? '',
      estado: map['estado'] != null
          ? Estado.fromMap(map['estado'])
          : map[3] != null
              ? Estado(id: map[3], uf: map[4], nome: map[5])
              : Estado(id: -1, uf: '', nome: ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cidade.fromJson(Map source) => Cidade.fromMap(source);

  @override
  String toString() => 'Cidade(id: $id, nome: $nome, estado: $estado)';
}
