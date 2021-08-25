void main(List<String> args) {
  /**
   * Inicio   Condicao    incremento
   * for (var i = 0; i < count; i++)
   */

  var numero = 0;
  while (numero <= 10) {
    print(numero);
    numero++;
  }

  var indice = 10;
  do {
    print('indice => $indice');
    indice--;
  } while (indice > 0);
}
