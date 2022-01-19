// Flutter 2.8 ficou melhor
void main(List<String> args) {
  var cor = Cores.vermelho;
  if (cor == Cores.vermelho) {}

  print(cor);

  // switch (cor) {
  //   case Cores.azul:
  //     // TODO: Handle this case.
  //     break;
  //   case Cores.vermelho:
  //     // TODO: Handle this case.
  //     break;
  //   case Cores.laranja:
  //     // TODO: Handle this case.
  //     break;
  //   case Cores.verde:
  //     // TODO: Handle this case.
  //     break;
  //   case Cores.preto:
  //     // TODO: Handle this case.
  //     break;
  // }

  // transformand a string azul em um enum Cores.azul.
  // antes da versão 2.15
  var azul = 'azul';
  var corAzul = Cores.values.where((cor) => cor.toString() == 'Cores.$azul');
  print(corAzul);

  // na 2.15 -> 2.8
  print(Cores.azul.name);
  var corAzul215 = Cores.values.byName(azul);
  print(corAzul215);

  var coresMap = Cores.values.asMap();
  print(coresMap);

  var coresNameMap = Cores.values.asNameMap();
  print(coresNameMap);

  var corAzulPeloMap = coresNameMap[azul];
  print(corAzulPeloMap);

  Cores.values.byName('branco');
  var corBranco = coresNameMap['branco'];
  print(corBranco);
}

enum Cores { azul, vermelho, laranja, verde, preto }
