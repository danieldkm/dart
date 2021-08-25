void main(List<String> args) {
  // ? = Nullable (Aceita nulo)
  // Sem nada (padrão) = non-null (Não aceita nulo)

  // Não aceita nulos
  var nomes = <String>[];

  // Aceita nulo
  List<String>? nomesNulos = [];

  //Lista não pode ser nulos nem os itens
  List<String> nomesInternosNaoAceitaNulos = ['t1'];
  var nomesInternosNaoAceitaNulos1 = ['t1'];

  // Lista não pode ser nula mas os itens internos podem ser nulos
  List<String?> nomesInternosAceitaNulos = ['t1', null, 't2', null];
  var nomesInternosAceitaNulos1 = <String?>['t1', null, 't2', null];

  // Lista pode ser nula e os itens tam podem ser nulos
  List<String?>? nomesInternosAceitaNulos2 = null; // ou ['t1', null];
}
