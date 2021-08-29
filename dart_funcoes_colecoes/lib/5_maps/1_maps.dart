void main(List<String> args) {
  // O mapa é uma representação de Chave:Valor
  final paciente = <String, String>{
    'nome': 'Daniel Morita',
    'curso': 'Academia do Flutter'
  };

  // print(paciente);

// O mapa pode ser nulo mas se for criado deve conger a chave
// e o valor nao nulos
  Map<String, String>? pacienteNullSafety = null;
  // O mapa e o valor não podem ser nulos mas chave pode ser nula
  Map<String?, String> pacienteNullSafety2 = {null: 'Daniel'};
  var pacienteNullSafety3 = <String?, String>{null: 'Daniel'};
  // O mapa e a chave não podem ser nulos mas o valor pode ser nulo
  var pacienteNullSafety4 = <String, String?>{'nome': null};

  var produtos = <String, String>{};
  // So sera adicionado se a chave nao existir
  produtos.putIfAbsent('nome', () => 'Daniel Morita');
  produtos.putIfAbsent('nome', () => 'Refrigerante');
  print(produtos);

  produtos.update('nome', (value) => 'Refrigerante');
  // produtos.update('nome2', (value) => 'Refrigerante2');
  produtos.update('preco', (value) => '10', ifAbsent: () => '10');
  print(produtos);

  // Recuperando o valor
  print('Produto ${produtos['nome']}');
  print('Produto ${produtos['preco']}');

  produtos.forEach((key, value) {
    print('Chave: $key: $value');
  });

  // Fazer algum processo asyncrono dentro dele.
  for (var entry in produtos.entries) {
    print('Chave: ${entry.key}: ${entry.value}');
  }
  for (var key in produtos.keys) {
    print('Chave: $key');
  }
  for (var value in produtos.values) {
    print('Value: $value');
  }

  var novoMapaProdutos = produtos.map((key, value) {
    return MapEntry(key + '_nova', value.toUpperCase());
  });
  print(novoMapaProdutos);

  var mapa = <String, Object /*ou dynamic*/ >{
    'nome': 'Daniel Morita',
    'cursos': [
      {
        'nome': 'Academia do Flutter',
        'descricao': 'Melhor curso de flutter do brasil'
      },
      {
        'nome': 'Academia do Flutter2',
        'descricao': 'Melhor curso de flutter do brasil2'
      }
    ]
  };
  print(mapa);
  print(mapa['cursos']);
}
