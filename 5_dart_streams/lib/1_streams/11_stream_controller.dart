import 'dart:async';

Future<void> main(List<String> args) async {
  print('inicio streamController');
  final streamController = StreamController<Pessoa>.broadcast();
  final inStream = streamController.sink;
  final outStream = streamController.stream;

  outStream.listen(
    (pessoa) {
      print('Seja bem vindo ${pessoa.nome}');
    },
  );

  var numeros = List.generate(20, (index) => index);
  for (var numero in numeros) {
    print('Enviando número $numero');
    inStream.add(Pessoa(nome: 'Daniel Morita $numero'));
    // await Future.delayed(Duration(milliseconds: 500));
  }

  print('fim streamController');
  await streamController.close();
}

class Pessoa {
  String nome;
  Pessoa({
    required this.nome,
  });
}
