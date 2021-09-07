void main(List<String> args) {
  print('inicio do p1');
  processo2();
  // 2 status (Incompleto, Concluido (com valor, com erro))
  // concluido com valor -> then
  // concluido com erro -> CatchErro ou OnError
  // WhenComplete sempre sera executado
  processo3().then(print);
  processo3()
      // .then((mensagem) => throw Exception('Erro no then'))
      .then((mensagem) {
    try {
      throw Exception('Erro no then');
    } catch (e) {}
  })
      // mesmo dando erro dentro do then não irá cair nos metodos de erro
      .catchError((error) => print('Erro ao executar o processo 3 $error'));

  processo4()
      .then((msg) => print('Mensagem do p4 $msg'))
      .catchError((erro) => print('Erro ao executar o processo 4'))
      .whenComplete(() => print('Finalizou p4'));

  processo4().then((msg) => print('Mensagem do p4 $msg'),
      onError: (error) => print('Tratando o erro pelo OnErro do then'));

  processo3().then(print).whenComplete(() => print('Finalizou com sucesso!'));
  print('fim do p1');
}

Future<void> processo2() async {
  print('Inicio do p2');
  Future.delayed(Duration(seconds: 2), () => print('fim do p2')
      // {
      //   var i = 0;
      //   while (i < 20) {
      //     print(i);
      //     i++;
      //   }
      //   print('fim do p2');
      // }
      );
}

Future<String> processo3() {
  print('Inicio p3');
  return Future.delayed(Duration(seconds: 3), () => 'Fim do p3');
}

Future<String> processo4() {
  print('Inicio p4');
  return Future.delayed(Duration(seconds: 3), () => throw Exception());
}
