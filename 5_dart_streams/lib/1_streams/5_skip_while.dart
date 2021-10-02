import 'dart:async';

void main(List<String> args) async {
  print('inicio');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );

  stream = stream.take(5).skipWhile((numero) {
    print('Numero que chegou na skipWhile $numero');
    return numero < 5;
  });

  await for (var i in stream) {
    print('O numero que chegou no await foi $i');
  }
  print('fim');
}

int callback(int value) {
  print('callback o valor que chegou é $value');
  return (value + 1) * 2;
}
