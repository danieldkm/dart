String? nome;
void main(List<String> args) {
  // = -= /= %= >>= ^=
  // += *= ~/= <<= &= !=

  var numero = 1;

  // numero = numero + 2;
  numero += 2;
  print(numero);

  var numero2 = 2.0;
  numero2 /= 2.0;
  print(numero2);

  print(nome);

  nome = 'Antes DKM';

  // if (nome == null) {
  //   nome = 'Daniel Morita';
  // }
  nome ??= 'Daniel Morita';

  print(nome);
}
