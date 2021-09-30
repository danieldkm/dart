import 'dart:async';

void main(List<String> args) async {
  print('inicio');
  final interval = Duration(seconds: 2);
  final stream = Stream<int>.periodic(
    interval,
    callback,
  );

  await for (var i in stream) {
    print(i);
  }
  print('fim');
}

int callback(int value) {
  print('o valor é $value');
  return (value + 1) * 2;
}
