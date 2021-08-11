void main(List<String> args) {
  String nomeCompleto = 'Daniel';
  print(nomeCompleto);
  nomeCompleto = 'Daniel Morita';
  print(nomeCompleto);

  /**
   * variaveis finais:
   * não podem ser alteradas depois de inicializadas (Imutáveis)
   * são definidas do program em tempo de execução (Runtime)
   * Utilize sem moderação
   */
  final nomeCompletoFinal = 'Daniel Morita';
  // nomeCompletoFinal = 'awdwadawd'; // não pode
  final nomeCompletoFinal2;
  nomeCompletoFinal2 = 'Daniel Morita';
  // nomeCompletoFinal2 = 'Daniel Morita2'; // não pode apos definir o tipo

  /**
   * variaveis const:
   * não podem ser alteradas depois de inicializadas (Imutáveis)
   * são definidas no programa em tempo de COMPILAÇÃO!!!
   * Não podem receber valores de outras váriveis a não ser que essas variáveis forem const também
   * Utilize sem moderação
   */
  const nomeCompletoConst = 'Daniel Morita';
  // const nomeCompletoConst2 = nomeCompleto; // não da pra atribuir um valor que pode ser modificado
  // const nomeCompletoConst3 = nomeCompletoFinal; // so é definido em tempo de compilação
  const nomeCompletoConst3 = nomeCompletoConst;
}
