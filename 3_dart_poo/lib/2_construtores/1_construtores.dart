import 'package:dart_poo/2_construtores/pessoa.dart';

void main(List<String> args) {
  // var pessoa = Pessoa('Daniel Morita', 35, 'Masculino');
  var pessoa = Pessoa(nome: 'Daniel Morita', idade: 35, sexo: 'Masculino');

  print(pessoa.nome);

  var pessoaNomeado = Pessoa.semNome(idade: 22, sexo: 'Outros');
  print(pessoaNomeado.nome);

  var pessoaFabrica = Pessoa.fabrica('dkm');
  print(pessoaFabrica.nome);
}
