import 'dart:async';

void main(List<String> args) async {
  print('inicio');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );

  stream = stream.takeWhile((int numero) => numero < 10);

  await for (var i in stream) {
    print(i);
  }
  print('fim');
}

int callback(int value) {
  print('o valor é $value');
  return (value + 1) * 2;
}
