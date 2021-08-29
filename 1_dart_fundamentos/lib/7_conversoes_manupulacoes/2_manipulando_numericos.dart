void main(List<String> args) {
  final idade = 30;
  print('sua idade e $idade');

  final valor = -20;
  print('valor negativo? ${valor.isNegative} => $valor');

  final valorDouble = 10.65;
  print(valorDouble.round());
  print(valorDouble.roundToDouble());

  final valorString = '30';
  final valorInt = int.parse(valorString);
  // final valorDouble = double.parse(valorString);
  print(valorInt);
  final valorInt2 = int.tryParse('a$valorString');
  // final valorDouble2 = double.tryParse(valorString);
  print(valorInt2);

  final precoCamisa = 30.27876;
  print(precoCamisa.toStringAsFixed(2));
}
