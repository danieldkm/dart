void main(List<String> args) {
  var pessoa = Pessoa()
    ..nome = 'Daniel Morita'
    ..email = 'danielmorita@hotmail.com'
    ..site = 'danielmorita.com.br'
    ..printPessoa();
  // pessoa.nome = 'Daniel Morita';
  // pessoa.email = 'danielmorita@hotmail.com';
  // pessoa.site = 'danielmorita.com.br';

  // print('''
  //   Pessoa:
  //     Nome: ${pessoa.nome}
  //     Email: ${pessoa.email}
  //     Site: ${pessoa.site}
  // ''');

  var mapa = Map<String, String>()
    ..putIfAbsent('nome', () => 'Daniel')
    ..putIfAbsent('email', () => 'null')
    ..putIfAbsent('site', () => '');
}

class Pessoa {
  String? nome;
  String? email;
  String? site;

  void printPessoa() {
    print('''
    Pessoa:
      Nome: $nome
      Email: $email
      Site: $site
  ''');
  }
}
