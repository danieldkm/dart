import 'pessoa.dart';

void main(List<String> args) {
  var p1 = const Pessoa(nome: 'Daniel', idade: 35);
  var p2 = const Pessoa(nome: 'Daniel', idade: 35);

  print(p1 == p2);
}

/// 
/// 1 - p1 = Pessoa(...)
/// 2 - p2 = Pessoa(...)
/// 
/// 1 - p1 = const Pessoa(...)
/// 2 - p2 = dart aponta para a const p1 porque os dados são iguais.