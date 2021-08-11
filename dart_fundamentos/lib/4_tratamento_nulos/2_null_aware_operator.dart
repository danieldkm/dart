String? nome;
void main(List<String> args) {
  var nomeCompleto = (nome != null ? nome! + ' Morita' : 'Daniel Morita');

  String nomeCompleto2;

  if (nome != null) {
    nomeCompleto2 = nome! + ' Morita';
  } else {
    nomeCompleto2 = 'Daniel Morita';
  }

  var nomeLocal = nome;
  if (nomeLocal == null) {
    nomeLocal = 'Daniel';
  }

  var nomeCompleto3 = nomeLocal + ' Morita';

  print(nomeCompleto3);

  // ---

  var sobrenome = ' Morita';
  var nomeCompleto4 = (nome ?? 'Daniel ') + sobrenome;
  var nomeCompleto5 = null;
  print(nomeCompleto5 ?? 'Daniel Morita5');
}
