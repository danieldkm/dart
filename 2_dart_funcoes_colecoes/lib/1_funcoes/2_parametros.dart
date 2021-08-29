void main(List<String> args) {
  // parametros obrigatorios por default
  print('A soma de dois inteiros e ${somaInteiros(10, 10)}');

  // parametros nomeados
  // parametros nomeado sao nullables por default
  // parametros nomeados podem ser promovidos para non-null com checagem de null
  print('A soma de dois doubles e ${somaDoubles(
    numero1: 10.1,
    numero2: 10.2,
  )}');
  print('A soma de dois doubles e ${somaDoublesObrigatorios(
    numero1: 10.1,
    numero2: 10.2,
  )}');
  print('A soma de dois doubles e ${somaDoublesObrigatorios2(
    numero1: null,
    numero2: 10.2,
  )}');
  print('A soma de dois doubles default e ${somaDoublesObrigatoriosDefault(
    numero2: 10.2,
  )}');

  // parametros opcional
  print(
      'A soma de dois int opcionais e ${somaIntOpcional(1)} ou ${somaIntOpcional()} ou ${somaIntOpcional(1, 1)}');

  parametrosNormaisComNomeados(1, nome: 't1', idade: 10);
  parametrosNormaisComNomeados2(2, 't2', 10);
  parametrosNormaisComNomeados2(2, 't2');
  parametrosNormaisComNomeados2(2);
}

int somaInteiros(int numero1, int numero2) {
  print('Executando a soma de inteiros ($numero1, $numero2)');
  return numero1 + numero2;
}

double somaDoubles({double? numero1, double? numero2}) {
  if (numero1 != null && numero2 != null) {
    return numero1 + numero2;
  }
  return 0.0;
}

double somaDoublesObrigatorios({
  required double numero1,
  required double numero2,
}) {
  return numero1 + numero2;
}

double somaDoublesObrigatorios2({
  required double? numero1,
  required double numero2,
}) {
  numero1 ??= 0;
  // if (numero1 == null) {
  //   numero1 = 0;
  // }
  return numero1 + numero2;
}

double somaDoublesObrigatoriosDefault({
  double numero1 = 0,
  double numero2 = 0,
}) {
  return numero1 + numero2;
}

int somaIntOpcional([int numero1 = 0, int numero2 = 0]) {
  return numero1 + numero2;
}

void parametrosNormaisComNomeados(
  int numero, {
  required String nome,
  required int idade,
}) {}

void parametrosNormaisComNomeados2(int numero, [String? nome, int? idade]) {}
void parametrosNormaisComNomeados3(int numero1, int numero2,
    [String? nome, int? idade]) {}
