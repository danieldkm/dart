import 'dart:convert';

import 'package:dart_consumo_apis/models/aluno.dart';
import 'package:http/http.dart' as http;

class AlunosRepository {
  Future<List<Aluno>> findAll() async {
    final alunosResponse = await http.get(
      Uri.parse('http://localhost:3031/alunos'),
    );

    final alunosList = jsonDecode(alunosResponse.body);

    return alunosList.map<Aluno>((alunoMap) {
      return Aluno.fromMap(alunoMap);
    }).toList();
  }

  Future<Aluno> findById(String id) async {
    final alunosResponse = await http.get(
      Uri.parse('http://localhost:3031/alunos/$id'),
    );
    // final alunoMap = jsonDecode(alunosResponse.body);
    // return Aluno.fromMap(alunoMap);

    return Aluno.fromJson(alunosResponse.body);
  }

  Future<void> update(Aluno aluno) async {
    await http.put(
      Uri.parse('http://localhost:3031/alunos/${aluno.id}'),
      body: aluno.toJson(),
      headers: {'content-type': 'application/json'},
    );
  }

  Future<void> insert(Aluno aluno) async {
    await http.post(
      Uri.parse('http://localhost:3031/alunos'),
      body: aluno.toJson(),
      headers: {'content-type': 'application/json'},
    );
  }
}
