import 'animal.dart';

class Cachorro extends Animal {
  Cachorro({required int idade}) : super(idade: idade, nome: 'Cachorro');
  @override
  int calcularIdadeHumana() {
    return idade * 7;
    // if (idade != null) {
    // }
    // return 0;
  }
}
