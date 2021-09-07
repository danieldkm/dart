Future<void> main(List<String> args) async {
  var nomes = ['Daniel', 'Joao', 'Leo'];

  print('inicio');

  // mas ainda continua async
  // TODO -> nao espera e continua rodando executa 1 por 1
  nomes.forEach((nome) async {
    print(await saudacao(nome));
  });

  // TODO -> aguardando para iniciar o proximo
  // await Future.forEach<String>(nomes, (nome) async {
  //   print(await saudacao(nome));
  // });

  // TODO -> aguardando para iniciar o proximo
  // for (var nome in nomes) {
  //   print(await saudacao(nome));
  // }

  // TODO -> executar todos de uma vez em paralelo parecido com Promise.all
  var nomesFuturo = nomes.map((nome) => saudacao(nome)).toList();
  var saudacoes = await Future.wait(nomesFuturo);
  print(saudacoes);
  var nomesFuturosNaMao = [
    saudacao('Daniel'),
    saudacao('Luana'),
    saudacao('Jean'),
  ];
  var saudacoes2 = await Future.wait(nomesFuturosNaMao);
  print(saudacoes2);

  print('fim');
}

Future<String> saudacao(String nome) {
  print('inicio saudadao $nome');
  return Future.delayed(Duration(seconds: 3), () {
    print('fim saudadao $nome');
    return 'Olá $nome';
  });
}

// Future<void> p1() async {
//   await saudacao('nome');
// }

// Future<String> p2() async {
//   await saudacao('nome');
//   return Future.value();
// }
