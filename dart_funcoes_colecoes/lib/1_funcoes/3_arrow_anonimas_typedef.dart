void main(List<String> args) {
  // funcoes arrow
  print(somaInteiros(10, 10));

  // funcoes anonimas
  () {
    print('funcoes anonimas');
  }();
  // não esta invocando a funcao
  somaInteiros;

  var nome = '';
  var idade = 1;
  var funcaoQualquer = () {
    print('chamou a funcao anonima');
  };
  print(nome.runtimeType);
  print(idade.runtimeType);
  print(funcaoQualquer.runtimeType);
  funcaoQualquer();

  print('Iniciando chamada');
  chamarUmaFuncaoDeUmParametro((nome) {
    if (nome.isEmpty) {
      print('Nome veio vazio');
    } else {
      print(nome);
    }
  });
  print('Finalizando chamada');

  // typedef
  funx2((nome, nomeCompleto, {qq, x, x2}) => 'null');
}

///
/// 3 partes
/// 1 tipo de retorno
/// 2 nome
/// 3 parametros (normais, nomeados e opcionais)
///
///

int somaInteiros(int numero1, int numero2) => numero1 + numero2;
void somaInteirosVoid(int numero1, int numero2) => numero1 + numero2;

void chamarUmaFuncaoDeUmParametro(Function(String nome) funcaoQueRecebeONome) {
  funcaoQueRecebeONome('chamarUmaFuncaoDeUmParametro');
}

void chamarUmaFuncaoDeUmParametro2(FuncaoQueRecebeNome funcaoQueRecebeONome) {
  funcaoQueRecebeONome('chamarUmaFuncaoDeUmParametro2');
}

void funx(
  String Function(
    String nome,
    String nomeCompleto, {
    required String? x,
    required String? x2,
    int? qq,
  })
      teste,
) {}

void funx2(
  FuncaoQueRecebeNomeComplexo teste,
) {}
typedef FuncaoQueRecebeNome = void Function(String nome);
typedef FuncaoQueRecebeNome2 = Function(String nome);
typedef FuncaoQueRecebeNomeComplexo = String Function(
  String nome,
  String nomeCompleto, {
  required String? x,
  required String? x2,
  int? qq,
});
