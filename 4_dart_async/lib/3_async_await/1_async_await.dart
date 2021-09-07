void main(List<String> args) async {
  try {
    print('inicio do main');
    var mensagem = await processo1();
    print(mensagem);
    var mensagem2 = await processo2();
    print(mensagem2);
    var mensagem3 = await processo3();
    print(mensagem3);
    print('fim do main');
  } catch (e) {
    print('erro na chamada de algum processo $e');
  }
}

Future<String> processo1() {
  print('Inicio p1');
  return Future.delayed(Duration(seconds: 3), () => 'Fim do p1');
}

Future<String> processo2() {
  print('Inicio p2');
  return Future.delayed(Duration(seconds: 3), () => 'Fim do p2');
}

Future<String> processo3() {
  print('Inicio p3');
  return Future.delayed(Duration(seconds: 3), () => throw Exception());
}
