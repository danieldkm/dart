import 'dart:io';

import 'fazer.dart';

@Fazer(
  quem: 'DAniel Morita na class',
  oque: 'tentando ler a anotacao da classe',
)
@gzip
class Pessoa {
  @Fazer(
    quem: 'DAniel Morita no atributo',
    oque: 'tentando ler a anotacao do atributo',
  )
  String? nome;

  @Fazer(
    quem: 'DAniel Morita no metodo',
    oque: 'tentando ler a anotacao do metodo',
  )
  void fazerAlgo() {}
}
