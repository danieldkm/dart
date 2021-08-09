// variaveis de nível superior não podem ser inicializdas depois
// não é permitido
// String nomeCompletoSuperior
String nomeCompletoSuperior = 'Teste';
String? nomeCompletoSuperiorOpc;
void main(List<String> args) {
  // segurança nula
  // variaveis locais não precisam ser inicializadas de cara porem
  // podem ser criadas sem valor e depois ser atribuido um valor
  String? nomeCompletoOpc;

  // ? aceita a variavel aceitar valor null
  String? nomeCompleto = null;
  // print(nomeCompleto?.length);
  // if (nomeCompleto != null) {
  //   print(nomeCompleto.length);
  // }

  // ! a variavel não vai ser nula, evitar o uso disso
  print(nomeCompleto!.length);

  /**
   * Váriveis locais que são nulas(nullable) por padrão
   * Se for atribuido um valor a ela, automaticamente elas são
   * promovidas a nao nulo (non-null)
   */
  nomeCompletoOpc = '';
  print(nomeCompletoOpc.length);
  /**
   * Váriaveis de nível superior NUNCA são promovidas para Não nulo (non-null)
   */
  nomeCompletoSuperiorOpc = '';
  // print(nomeCompletoSuperiorOpc.length);
}
