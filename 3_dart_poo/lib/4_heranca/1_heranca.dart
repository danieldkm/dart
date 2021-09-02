import 'package:dart_poo/4_heranca/cachorro.dart';

void main(List<String> args) {
  var cachorro = Cachorro(idade: 7);
  print(cachorro.recuperarIdade());
  print(cachorro.calcularIdadeHumana());
  print('''
    Cachorro:
      Tamanho: ${cachorro.tamanho}
      idade: ${cachorro.idade}
      Idade humnada: ${cachorro.calcularIdadeHumana()}
  ''');
}
