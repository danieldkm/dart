import 'dart:convert';

import 'package:dart_consumo_apis/controller/alunos_controller.dart';
import 'package:dart_consumo_apis/controller/filmes_controller.dart';
import 'package:dart_consumo_apis/models/aluno.dart';
import 'package:dart_consumo_apis/models/telefone.dart';

void main(List<String> args) async {
  // AlunosController().findAll();

  // await AlunosController().update("1");
  // await AlunosController().findById("1");

  // await AlunosController().insert();
  // await AlunosController().findAll();

  // FilmesController().findAll();
  // FilmesController().findById("634649");

  // await FilmesController().update("634649");
  // await FilmesController().findById("634649");

  // await FilmesController().insert();
  await FilmesController().findById("64509090-c09e-11ec-94fc-f59f2339ed49");
}

void main2(List<String> arguments) {
  String cidadeJson =
      '''
    {
      "id": 1,
      "nome": "Ibiporã"
    }
  ''';

  // converter json para cidade
  // [] => List<dynamic>
  // {} => Map<String, dynamic>
  final cidadeMap = json.decode(cidadeJson);
  print(cidadeMap.runtimeType);
  print(cidadeMap);
  print(cidadeMap[0].runtimeType);

  if (cidadeMap is List) {
    print('é uma lista');
  } else if (cidadeMap is Map) {
    print('é um map');
  }

  final telefoneJson =
      '''
    {
      "ddd": 11,
      "telefone": "123456789"
    }
  ''';

  final telefone = Telefone.fromJson(telefoneJson);

  print(telefone.ddd);
  print(telefone.telefone);
  print(telefone.toJson());
  print(telefone.toMap());
}
