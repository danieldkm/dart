// Isso aqui é uma classe abstrata
// pois tem metodos implementado
abstract class CarroAbstrata {
  void velocidadeMaxima() {}
}

// isso é uma interface
// pois não tem metodos implementados
abstract class Carro {
  abstract int portas;
  abstract int rodas;
  abstract String motor;
  int velocidadeMaxima();
}
