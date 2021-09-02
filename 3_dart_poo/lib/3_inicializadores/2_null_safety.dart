import 'cliente.dart';

void main(List<String> args) {
  var cliente = Cliente(nome: 'Daniel');
  cliente.nome = 'Daniel2';
  // cliente.nome = 'Daniel3';
  print(cliente.nome);
}
