void main(List<String> args) {
  // && (E)
  // || (OU)
  // ! (NEGA)

  final sexo = 'F';
  final idade = 118;

  if (sexo == 'M' && idade >= 18 ||
      sexo == 'F' && idade >= 28 ||
      !(sexo == 'X')) {
    print('pode');
  } else {
    print('nao pode');
  }
}
