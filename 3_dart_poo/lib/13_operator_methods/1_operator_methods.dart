import 'numero.dart';

void main(List<String> args) {
  var num1 = Numero(10);
  var num2 = Numero(20);

  var totalSoma = num1 + num2;
  print(totalSoma.i);

  var totalSub = num1 - num2;
  print(totalSub.i);
}
