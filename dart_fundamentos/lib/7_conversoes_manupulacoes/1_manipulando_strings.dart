void main(List<String> args) {
  final nome = 'Daniel Morita';

  var subStringNome = nome.substring(7);
  print(subStringNome);

  var subStringNome2 = nome.substring(0, 7);
  print(subStringNome2);

  var sexo = 'Masculino';
  print("sigla sexo ${sexo.substring(0, 1)}");
  print("sexo masculino? ${sexo.toUpperCase().startsWith('M')}");
  print("nome contem Morita? ${nome.toLowerCase().contains('morita')}");

  // Interpolação;
  var primeiroNome = 'Daniel';
  var segundoNome = 'Morita';
  print('Ola $primeiroNome $segundoNome seja bem vindo');
  print(
      'Ola ${primeiroNome.toUpperCase()} ${segundoNome.toLowerCase()} seja bem vindo');

  print('Soma de 2 + 2 e ${2 + 2}');

  var paciente = 'Daniel Morita|30|Especialista Dar e Flutter|PR';
  paciente.split('|').forEach(print);

  var pacientes = [
    'Daniel Morita|30|Especialista Dar e Flutter|PR',
    'Daniel Morita2|32|Especialista Dar e Flutter2|PR2',
  ];

  for (var paciente in pacientes) {
    var dadosPaciente = paciente.split('|');
    var nomeCompleto = dadosPaciente[0];
    var nomes = nomeCompleto.split(' ');
    print(nomes.last);
  }
}
