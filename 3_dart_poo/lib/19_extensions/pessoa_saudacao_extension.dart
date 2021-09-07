import 'pessoa.dart';

extension PessoaSaudacaoExtension on Pessoa {
  String saudacao() {
    return 'Olá $nome bem vindo a academia do flutter.';
  }
}
