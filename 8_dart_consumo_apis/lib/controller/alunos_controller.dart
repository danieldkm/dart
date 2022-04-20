import 'package:dart_consumo_apis/models/aluno.dart';
import 'package:dart_consumo_apis/models/cidade.dart';
import 'package:dart_consumo_apis/models/curso.dart';
import 'package:dart_consumo_apis/models/endereco.dart';
import 'package:dart_consumo_apis/models/telefone.dart';
import 'package:dart_consumo_apis/repositories/alunos_repository.dart';

class AlunosController {
  final _alunosRepository = AlunosRepository();

  Future<void> findAll() async {
    final alunos = await _alunosRepository.findAll();
    alunos.forEach(print);
  }

  Future<Aluno> findById(String id) async {
    final aluno = await _alunosRepository.findById(id);
    print(aluno);
    return aluno;
  }

  Future<void> update(String id) async {
    final aluno = await findById(id);
    aluno.nomeCursos.add("Teste novo curso");
    await _alunosRepository.update(aluno);
  }

  Future<void> insert() async {
    final aluno = Aluno(
      nome: "Daniel novo",
      nomeCursos: ["Academia do Flutter"],
      endereco: Endereco(
        rua: "rua jose",
        numero: 1,
        cep: "86200000",
        cidade: Cidade(id: 2, nome: "Ibipora"),
        telefone: Telefone(ddd: 43, telefone: "999999999"),
      ),
      cursos: [
        Curso(id: 1, nome: "Academia do Flutter", isAluno: true),
        Curso(id: 2, nome: "Imersão GetX", isAluno: false),
      ],
    );
    await _alunosRepository.insert(aluno);
  }
}
