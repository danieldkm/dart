class Pessoa {
  String? nome;
  int? idade;
  String? sexo;

// Contrutor default
  // Pessoa(
  //   String nome,
  //   int idade,
  //   String sexo,
  // ) {
  //   nome = nome;
  //   idade = idade;
  //   sexo = sexo;
  // }

  // Pessoa({
  //   required String nome,
  //   required int idade,
  //   required String sexo,
  // }) {
  //   nome = nome;
  //   idade = idade;
  //   sexo = sexo;
  // }

  Pessoa({
    required this.nome,
    required this.idade,
    required this.sexo,
  });

  // Construtores nomeados
  Pessoa.semNome({
    required this.idade,
    required this.sexo,
  });

  Pessoa.vazia();

  // Contruturo tipo fabrica
  // é utilizado quando temos uma regra de negocio
  // para criação da nossa classe.
  factory Pessoa.fabrica(String nomeContr) {
    var nome = nomeContr + '_Fabrica';
    var pessoa = Pessoa.vazia();
    pessoa.nome = nome;
    return pessoa;
  }
}
