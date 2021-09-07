import 'package:dart_poo/17_asserts/cliente.dart';

void main(List<String> args) {
  var cli = Cliente(
    // cpf: '12312312312',
    nome: 'awdawdwad',
    razaoSocial: '12312',
    cnpj: '123123123',
  );
  print(cli.nome);
}
