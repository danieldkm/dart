void main(List<String> args) {
  var numeros = List.generate(10, (index) => index);
  for (var i = 0; i < numeros.length; i++) {
    if (i == 5) {
      continue;
    }
    print(numeros[i]);
  }

  // não utilizar o forEach em funcoes async
  numeros.where((numero) => numero != 5).forEach((numero) => print(numero));

  final numerosAte5 = numeros.takeWhile((numero) => numero < 6);
  print(numerosAte5);
  print(numeros[1]);
  print(numerosAte5.elementAt(1));
  final numerosAte3 = numeros.takeWhile((numero) => numero < 4).toList();
  print(numerosAte3);

  final numerosRemoverAte5 = numeros.skipWhile((numero) => numero < 6).toList();
  print(numerosRemoverAte5);

  var nomes = ['Daniel', 'Vinicius', 'Leonardo', 'Cleitons'];
  var nomesSkip = nomes.skipWhile((nome) => nome != 'Leonardo').toList();
  print(nomesSkip);

  var numerosStrList = numeros.map((numero) => 'numero é $numero').toList();
  print(numerosStrList);

  final numerosRevertidos = numeros.reversed.toList();
  print(numerosRevertidos);
}
