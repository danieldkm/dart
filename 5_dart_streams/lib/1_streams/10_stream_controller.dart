import 'dart:async';

Future<void> main(List<String> args) async {
  print('inicio streamController');
  final streamController = StreamController<int>.broadcast();
  final inStream = streamController.sink;
  final outStream = streamController.stream;

  outStream
      .skip(1)
      .where((numero) => numero % 2 == 0)
      .map((numero) => 'O valor par enviado é $numero')
      .listen(
    (strConvertida) {
      print('string recebida');
      print(strConvertida);
    },
  );

  var numeros = List.generate(20, (index) => index);
  for (var numero in numeros) {
    print('Enviando número $numero');
    inStream.add(numero);
    // await Future.delayed(Duration(milliseconds: 500));
  }

  print('fim streamController');
  await streamController.close();
}
