// import 'package:dart_funcoes_colecoes/7_imports/somas/soma.dart';
import 'somas/soma.dart' as soma;
import 'somas_nova/soma.dart' as soma_nova;

void main(List<String> args) {
  print(soma.somaInteiros(1, 10));
  print(soma_nova.somaInteiros(1, 10));
}
