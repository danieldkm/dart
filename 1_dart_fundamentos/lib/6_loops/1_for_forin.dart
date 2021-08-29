void main(List<String> args) {
  var numeros = List.generate(10, (index) => index);
  var nomes = ['Daniel', 'Vinicius', 'Leonardo', 'Cleitons'];

  for (var i = 0; i < numeros.length; i++) {
    print(numeros[i]);
  }

  for (var i = 0; i < nomes.length; i++) {
    print(nomes[i]);
  }

  for (var numero in numeros) {
    print(numero);
  }

  for (var nome in nomes) {
    print(nome);
  }

  // parando no meio
  for (var i = 0; i < nomes.length; i++) {
    print(nomes[i]);
    if (nomes[i] == 'Leonardo') {
      break;
    }
  }
  for (var i = 0; i < nomes.length; i++) {
    if (i == 1 || i == 3) {
      continue;
    }
    print(nomes[i]);
  }
}
