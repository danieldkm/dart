import 'joao.dart';

void main(List<String> args) {
  // joão é um artista
  // joão é um cantor
  // joão é um dançarino
  var joao = Joao();

  print('''
    João:
      habilidade: ${joao.habilidade()},
      Cantar: ${joao.cantar()},
      Dançar: ${joao.dancar()}
  ''');
}
