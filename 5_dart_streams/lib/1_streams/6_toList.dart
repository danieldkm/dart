import 'dart:async';

void main(List<String> args) async {
  print('inicio');
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(
    interval,
    callback,
  );

  stream = stream.take(5);

  final data = await stream.toList();
  print(data);
  print('fim');
}

int callback(int value) {
  print('callback o valor que chegou é $value');
  return (value + 1) * 2;
}
