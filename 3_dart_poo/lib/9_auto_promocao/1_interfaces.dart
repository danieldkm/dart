import 'carrto.dart';
import 'gol.dart';
import 'uno.dart';

// Variaveis de tipo superior e atributos de classe
// não são auto promovidas para o tipo checado!
Carro golCarro2 = Gol();
void main(List<String> args) {
  var gol = Gol();
  var uno = Uno();

  Carro golCarro = Gol();

  // forma 1
  // var tipoDeRodas = (uno as Gol).tipoDeRodas();
  // print('tipo de rodas $tipoDeRodas');

  // forma 2
  // Quando checamos se a variavel(is) é de um tipo
  // caso ela seja o dart vai automaticamente converter
  // essa instancia para a classe do tipo!!
  if (golCarro is Gol) {
    golCarro.tipoDeRodas();
  }

  if (golCarro2 is Gol) {
    // golCarro2.tipoDeRodas();
  }

  // print(gol.velocidadeMaxima());
  // print(uno.velocidadeMaxima());
  printarOsDadosDoCarro(gol);
  printarOsDadosDoCarro(uno);
}

void printarOsDadosDoCarro(Carro carro) {
  print('''
    Carro:
      Tipo: ${carro.runtimeType}
      Portas: ${carro.portas},
      Rodas: ${carro.rodas},
      Motor: ${carro.motor},
      Velocidade Maxima: ${carro.velocidadeMaxima()},
      Tipo de Rodas: ${carro is Gol ? carro.tipoDeRodas() : 'Não disponível'}
  ''');
}
