void main() {
  //! Detalhe sobre a String
  //! A String é composta por 3 campos (Nome|Idade|Sexo)
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  //! Baseado na lista acima.
  //! 1 - Remova os pacientes duplicados e apresente a nova lista
  print('1 - Remova os pacientes duplicados e apresente a nova lista');
  var nonDuplicatePessoas = removerDuplicados(pessoas);
  nonDuplicatePessoas.forEach(print);
  //! 2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas
  print('');
  print(
      '2 - Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome delas');
  exibirQuantidadeENomesPorSexoDePessoas(nonDuplicatePessoas);
  //! 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome
  print('');
  print(
      '3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome');
  // var maiorDe18 = [];
  // for (var pessoa in nonDuplicatePessoas) {
  //   var idade = int.parse(pessoa[1]);
  //   if (idade > 18) {
  //     maiorDe18.add(pessoa);
  //   }
  // }
  var maioresDe18 = nonDuplicatePessoas.where((p) {
    var idade = int.parse(p[1]);
    return idade > 18;
  });

  maioresDe18.forEach((pessoa) => print('${pessoa[0]} => ${pessoa[1]}'));
  //! 4 - Encontre a pessoa mais velha e apresente o nome dela.
  print('');
  print('4 - Encontre a pessoa mais velha e apresente o nome dela.');
  // var pessoasList = <List<String>>[];
  // for (var pessoa in nonDuplicatePessoas) {
  //   pessoasList.add(pessoa);
  // }
  var maisVelha =
      nonDuplicatePessoas.fold<List<String>>([], (previousValue, pessoa) {
    if (previousValue.isEmpty) {
      return pessoa;
    }
    var idadeAtual = int.parse(previousValue[1]);
    var idadeCorrente = int.parse(pessoa[1]);
    if (idadeCorrente > idadeAtual) {
      return pessoa;
    }
    return previousValue;
  });
  print(maisVelha);
  print(maisVelha[0]);
}

List<List<String>> removerDuplicados(List<String> pessoas) {
  return pessoas.toSet().map((p) => p.split('|')).toList();
}

void exibirQuantidadeENomesPorSexoDePessoas(List<List<String>> pessoas) {
  var masculinos = <String>[];
  var femininos = <String>[];
  var outros = <String>[];
  for (var pessoa in pessoas) {
    var sexo = pessoa[2].toLowerCase();
    var nome = pessoa[0];
    if (sexo == 'masculino') {
      masculinos.add(nome);
    } else if (sexo == 'feminino') {
      femininos.add(nome);
    } else {
      outros.add(nome);
    }
  }
  print('Num total de ${pessoas.length} pessoas:');
  print('Tem ${masculinos.length} pessoas do sexo Masculino => ');
  masculinos.forEach(print);
  print('Tem ${femininos.length} pessoas do sexo Feminino  => ');
  femininos.forEach(print);
  print('Tem ${outros.length} pessoas do sexo indefinido  => ');
  outros.forEach(print);
}
