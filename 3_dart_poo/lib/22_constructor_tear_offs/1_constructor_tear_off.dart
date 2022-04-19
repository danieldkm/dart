// melhoria a partir da ver 2.15
void main(List<String> args) {
  final nomes = ['Daniel', 'Guilherme', 'Renato', 'Sandra'];

  final pessoasAntigo = nomes.map((nome) => Pessoa(nome)).toList();

  //novo
  // final pessoas = nomes.map<Pessoa>(Pessoa.new).toList();
  final pessoas = nomes.map<Pessoa>(Pessoa.fromJson).toList();
  // final pessoas = nomes.map<Pessoa>(Pessoa.nome).toList();

  for (var pessoa in pessoas) {
    print('Ola ${pessoa.nome}');
  }

  funcaoQualquer(Pessoa.new);
}

// o tipo da funcao poderia ser dynamic, Object e Pessoa
void funcaoQualquer(void Function(String nome) funcao) {
  funcao('Teste');
}

class Pessoa {
  String nome;
  Pessoa(this.nome);
  Pessoa.nome(this.nome);

  factory Pessoa.fromJson(String nome) {
    return Pessoa(nome);
  }
}
