import 'package:dart_poo/19_extensions/pessoa_saudacao_extension.dart';

import 'pessoa.dart';
import 'saudacao_string_extension.dart';

void main(List<String> args) {
  var nome = 'Daniel Morita';

  print(nome.saudacao());

  var p1 = Pessoa(nome: 'João');
  print(p1.saudacao());
}
