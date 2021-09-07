void main(List<String> args) {
  var pessoa = Pessoa();
  // pessoa.nome = 'Daniel Morita';
  // pessoa.setNome('Daniel Morita');
  print(pessoa.nome);
  pessoa.nome = 'Daniel Morita';
}

// class Pessoa {
//   String? nome;
// }

// class Pessoa {
//   String? _nome;

//   String? getNome() => _nome;
//   void setNome(String? nome) => _nome = nome;
// }

class Pessoa {
  String? _nome;

  String? get nome => _nome;
  // set nome(String? nome) => _nome = nome;
  set nome(String? nome) {
    if (nome != null && nome.length > 3) {
      _nome = nome;
    }
  }
}

// class PessoaJava {
//   String? _nome;
//   String? getNome() => _nome;
//   void setNome(String? nome) {
//     if (nome != null && nome.length > 2) {
//       _nome = nome;
//     }
//   }
// }
