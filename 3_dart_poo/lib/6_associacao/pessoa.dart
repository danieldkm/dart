class Pessoa {
  String? nome;
  // composição
  // quando um atribudo de associação é obrigatório
  // nós estamos falando de composição
  Endereco endereco = Endereco();

  // Agregação
  // Quando um atributo de associação não é obrigatório
  // nós estamos falando de agregação
  Telefone? telefone;
}

class Endereco {}

class Telefone {}
