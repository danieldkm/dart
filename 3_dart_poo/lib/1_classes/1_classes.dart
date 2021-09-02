import 'camiseta.dart';

void main(List<String> args) {
  var camisetaNike = Camiseta();
  camisetaNike.tamanho = 'G';
  camisetaNike.cor = 'Preta';
  camisetaNike.marca = 'Nike';

  print(Camiseta.nome);
  Camiseta.nome = 'teste';
  print(Camiseta.nome);
  // Camiseta.nome2 = 'teste2';
  print(Camiseta.recuperarNome());

  print('''
    Camiseta: 
      Tamanho: ${camisetaNike.tamanho}
      Cor: ${camisetaNike.cor}
      Marca: ${camisetaNike.marca}
      Tipo lavavem: ${camisetaNike.tipoDeLavagem()}
  ''');
  var camisetaAdidas = Camiseta();
  camisetaAdidas.tamanho = 'G';
  camisetaAdidas.cor = 'Verde';
  camisetaAdidas.marca = 'Adidas';

  print('''
    Camise: 
      Tamanho: ${camisetaAdidas.tamanho}
      Cor: ${camisetaAdidas.cor}
      Marca: ${camisetaAdidas.marca}
      Tipo lavavem: ${camisetaAdidas.tipoDeLavagem()}
  ''');
}
