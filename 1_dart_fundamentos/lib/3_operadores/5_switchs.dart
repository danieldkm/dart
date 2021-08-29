void main(List<String> args) {
  final diaDaSemana = 1;

  switch (diaDaSemana) {
    case 0:
      print('dom');
      break;
    case 1:
      print('segunda');
      break;
    case 2:
      print('ter');
      break;
    default:
      print('não existe');
  }

  final idade = 20;

  switch (idade) {
    case 18:
    case 19:
    case 20:
      print('maior de idade');
      break;
    default:
      print('menor de idade');
  }
}
