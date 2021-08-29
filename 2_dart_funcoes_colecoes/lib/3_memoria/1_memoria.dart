void main(List<String> args) {
  var lista = ['Daniel'];
  print(lista.hashCode);
  print(lista);

  funcao(lista);
  print(lista);

  print('---------');
  var nome = 'Daniel Morita';
  print('$nome -> ${nome.hashCode}');
  funcao2(nome);
  print('$nome -> ${nome.hashCode}');
}

void funcao2(String nome) {
  nome += 'Academia do flutter';
  print('$nome -> ${nome.hashCode}');
}

void funcao(List<String> nomes) {
  print(nomes.hashCode);
  nomes.add('Morita');
}
