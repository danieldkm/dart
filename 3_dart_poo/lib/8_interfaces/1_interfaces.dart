import 'carrto.dart';
import 'gol.dart';
import 'uno.dart';

void main(List<String> args) {
  var gol = Gol();
  var uno = Uno();

  // print(gol.velocidadeMaxima());
  // print(uno.velocidadeMaxima());
  printarOsDadosDoCarro(gol);
  printarOsDadosDoCarro(uno);
}

void printarOsDadosDoCarro(Carro carro) {
  print(
      '''
    Carro:
      Tipo: ${carro.runtimeType}
      Portas: ${carro.portas},
      Rodas: ${carro.rodas},
      Motor: ${carro.motor},
      Velocidade Maxima: ${carro.velocidadeMaxima()}
  ''');
}
