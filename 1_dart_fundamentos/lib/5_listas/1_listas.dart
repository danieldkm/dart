void main(List<String> args) {
  // declaração normal
  List<int> listNumeros = [1, 2, 3];

  // declaração
  var listNumeros2 = [1, 2, 3];

  // afirmando o tipo da lista
  List<int> listSemDados = [];
  // Errado !!
  var listSemDados1 = [];
  // tipando o tipo da lista
  // certo !!
  var listSemDados2 = <int>[];
}
