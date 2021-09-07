import 'pessoa.dart';

/// Memoria | Variavel | Valor
/// 1       | nome     | 'Daniel'
/// 2       | nome2    | 'Daniel'
///
void main(List<String> args) {
  String nome = 'Daniel';
  String nome2 = 'Daniel';

  // no java
  // if (nome == nome2) // por referencia de memoria
  // if (nome.equals(nome2)) por igualdade

  if (nome == nome2) {
    print('É igual');
  } else {
    print('Não é igual');
  }

  /// Referencia
  /// Memoria | variavel | valor
  /// 1       | p1       | Pessoa()
  /// 2       | p2       | Pessoa()
  ///
  /// p1 == p2 => 1 == 2 ? false
  ///
  /// em Pessoa foi implementado o operator method ==, para validar o estado do objeto
  ///
  var p1 = Pessoa(
      nome: 'Daniel',
      email: 'danielmorita@hotmail.com',
      telefone: '1111111123');
  var p2 = Pessoa(
      nome: 'Daniel',
      email: 'danielmorita@hotmail.com',
      telefone: '1111111123');

  print(p1.hashCode);
  print(p2.hashCode);
  print(p2);

  if (p1 == p2) {
    print('Pessoa É igual');
  } else {
    print('Pessoa Não é igual');
  }
}
