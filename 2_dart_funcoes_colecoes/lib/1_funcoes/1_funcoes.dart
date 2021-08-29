void main(List<String> args) {
  final valorCalcularo = somaInteiros(10, 10);
  print('A soma de dois inteiros e $valorCalcularo');
}

int somaInteiros(int numero1, int numero2) {
  print('Executando a soma de inteiros ($numero1, $numero2)');
  return numero1 + numero2;
}
