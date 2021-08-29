void main(List<String> args) {
  final numeros = [1, 2, 3, 4, 5];
  print(numeros);
  numeros.add(1);
  print(numeros);

  final nomes = ['Daniel', 'Leonardo', 'Vinicius', 'Cleiton'];
  print(nomes);
  nomes.add('Luana');
  nomes.addAll(['Luana2', 'Luana3']);
  print(nomes);
  print(nomes[0]);
  print(nomes[1]);

  print('adicionando jose na lista');
  nomes.insert(0, 'Jose');
  print(nomes);
  nomes.insertAll(3, ['Jose 2', 'Jose 3']);
  print(nomes);

  nomes.remove('Jose 3');
  print(nomes);

  nomes.removeWhere((nome) => nome == 'Jose');
  print(nomes);

  print(nomes[0]);
  print(nomes.first);
  print(nomes[nomes.length - 1]);
  print(nomes.last);

  print("primero nome => ${nomes.firstWhere((nome) => nome == 'Jose 2')}");

  final numerosGerados = List.generate(10, (index) => ++index);
  print(numerosGerados);

  final repetidocoes = List.filled(10, null);
  print(repetidocoes);

  final numerosGeradosParaCalculo = List.generate(100, (index) => ++index);
  var soma = numerosGeradosParaCalculo.fold<int>(
      0, (previousValue, numero) => previousValue += numero);
  print(soma);
  print(
      "com reduce => ${numerosGeradosParaCalculo.reduce((value, numero) => value += numero)}");

  // Spread operator (...)

  var listaNumerosSpreadB = [4, 5, 6];
  var listaNumeroSpread = [1, 2, 3, ...listaNumerosSpreadB];
  print(listaNumeroSpread);

  // collection if
  var promicaoAtiva = false;
  var produtos = [
    'Cerveja',
    'Refrigerante',
    if (promicaoAtiva) 'Suco de laranja'
  ];
  print(produtos);

  // collection for
  var listaInts = [1, 2, 3];
  var listaStrings = ['#0', '#01', for (var i in listaInts) '#$i'];
  print(listaStrings);

  print(listaStrings.map((e) => e.isEmpty));
  print(listaStrings.join(' -> '));
  print(listaStrings.asMap());
  print(listaStrings.reduce((value, numero) => value += numero));
  listaStrings.clear();
  print(listaStrings);
}
