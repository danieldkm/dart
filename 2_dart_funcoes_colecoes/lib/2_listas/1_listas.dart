void main(List<String> args) {
  var numeros = List.generate(10, (index) => index);
  numeros.forEach(print);
  numeros.forEach(printAcademia);

  // Expand
  // Array BiDimencional
  var lista = [
    [1, 2],
    [3, 4],
  ];

  var listaNova = [...lista[0], ...lista[1]];
  print('listaNova $listaNova');
  var listaNova2 = lista.expand((numeros) => numeros).toList();
  print('listaNova2 => $listaNova2');

  // any
  final listaBusca = ['Rodrigo', 'João', 'josé'];

  if (listaBusca.any((nome) => nome == 'João')) {
    print('Tem João');
  } else {
    print('Não Tem João');
  }

  // every
  final listaBusca2 = ['Rodrigo', 'João', 'josé'];
  if (listaBusca2.every((nome) => nome.contains('J'))) {
    print('Todos os nomes tem a letra J');
  } else {
    print('Nem Todos os nomes tem a letra J');
  }
  if (listaBusca2.every((nome) => nome.contains('o'))) {
    print('Todos os nomes tem a letra o');
  } else {
    print('Nem Todos os nomes tem a letra o');
  }

  // .sort
  print('.sort');
  var listaParaOrdenacao = [99, 22, 10, 9, 0, 765, 1, 2, 3, 100, 300];
  listaParaOrdenacao.sort();
  print('sorting => $listaParaOrdenacao');
  var listaNomesParaOrdenacao = ['Rodrigo', 'João', 'josé', 'Arthur', 'Andre'];
  listaNomesParaOrdenacao.sort();
  print('sorting names => $listaNomesParaOrdenacao');

  var listaPacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];
  listaPacientes.sort();
  print('sorting pacientes => $listaPacientes');
  print('ordenar por idade do paciente');
  listaPacientes.sort((paciente1, paciente2) {
    final pacienteDados1 = paciente1.split('|');
    final pacienteDados2 = paciente2.split('|');

    final idadePaciente1 = int.parse(pacienteDados1[1]);
    final idadePaciente2 = int.parse(pacienteDados2[1]);
    if (idadePaciente1 > idadePaciente2) {
      return 1;
    } else if (idadePaciente1 == idadePaciente2) {
      return 0;
    } else {
      return -1;
    }
  });
  print('sorting pacientes by idade => $listaPacientes');

  // compareTo
  print('.sort com CompareTo');
  var listaPacientes2 = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];
  var novaListaPacientes = [...listaPacientes2];
  listaPacientes2.sort((paciente1, paciente2) {
    final pacienteDados1 = paciente1.split('|');
    final pacienteDados2 = paciente2.split('|');

    final idadePaciente1 = int.parse(pacienteDados1[1]);
    final idadePaciente2 = int.parse(pacienteDados2[1]);
    return idadePaciente1.compareTo(idadePaciente2);
  });
  print('sorting with compareTo pacientes by idade => $listaPacientes');
  print(novaListaPacientes);

  // pacientes por funcao
  var listaPacientes3 = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];
  print('antes');
  print(listaPacientes3);
  funcaoQualquer(listaPacientes3);
  print('depois');
  print(listaPacientes3);
}

void printAcademia(int valor) {
  print('printAcademia => $valor');
}

void funcaoQualquer(List<String> pacientes) {
  final localPacientes = [...pacientes];
  localPacientes.sort((paciente1, paciente2) {
    final pacienteDados1 = paciente1.split('|');
    final pacienteDados2 = paciente2.split('|');

    final idadePaciente1 = int.parse(pacienteDados1[1]);
    final idadePaciente2 = int.parse(pacienteDados2[1]);
    return idadePaciente1.compareTo(idadePaciente2);
  });
  print(localPacientes);
}
