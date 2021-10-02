import 'dart:async';

void main(List<String> args) async {
  print('inicio');
  final interval = Duration(seconds: 1);
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );
  stream = stream.asBroadcastStream().take(10);

  stream.listen((numero) {
    print('Listen 1 value: $numero');
  });

  stream.listen((numero) {
    print('Listen 2 value: $numero');
  });

  print('fim');
}

int callback(int value) {
  print('callback o valor que chegou é $value');
  return (value + 1) * 2;
}
