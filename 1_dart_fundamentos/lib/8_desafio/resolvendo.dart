void main() {
  //! Detalhe sobre a String
  //! A String é composta por 4 campos (Nome|Idade|Profissão|Estado onde mora)
  final pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];
  //! Baseado no array acima monte um relatório onde:
  //! 1 - Apresente os pacientes com mais de 20 anos e print o nome deles
  //! 2 - Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)
  //! 3 - Apresente a quantidade de pacientes que moram em SP

  for (var paciente in pacientes) {
    var dadosPaciente = paciente.split('|');
    var nomeCompleto = dadosPaciente[0];
    var idade = int.parse(dadosPaciente[1]);
    if (idade > 20) {
      print('$nomeCompleto -> $idade');
    }
  }
  final profissoes = ['desenvolvedor', 'estudante', 'dentista', 'jornalista'];
  profissoes.forEach((profissao) {
    final qtd = pacientes.fold<int>(
        0,
        (previousValue, paciente) => previousValue +=
            paciente.toLowerCase().contains(profissao) ? 1 : 0);
    print('Quantidade de pacientes com profissão de $profissao $qtd');
  });
  profissoes.forEach((profissao) {
    final nomes = pacientes.fold<List<String>>([], (previousValue, paciente) {
      final dados = paciente.split('|');
      final nome = dados[0];
      final prof = dados[2].toLowerCase();
      if (prof == profissao) {
        previousValue.add(nome);
      }
      return previousValue;
    });
    print('Quantidade de pacientes com profissão de $profissao');
    nomes.forEach(print);
  });

  final qtdEmSP = pacientes.fold<int>(
      0,
      (previousValue, paciente) => previousValue +=
          paciente.split('|')[3].toLowerCase() == 'sp' ? 1 : 0);
  print('Quantidade morando em SP $qtdEmSP');
  final nomesEmSP = pacientes.fold<List<String>>([], (previousValue, paciente) {
    final dados = paciente.split('|');
    final nome = dados[0];
    final uf = dados[3].toLowerCase();
    if (uf == 'sp') {
      previousValue.add(nome);
    }
    return previousValue;
  });
  nomesEmSP.forEach(print);
}
