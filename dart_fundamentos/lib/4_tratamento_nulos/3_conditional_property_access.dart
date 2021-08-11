String? nomeCompleto;
void main(List<String> args) {
  // null aware operator
  // var nomeCompletoLocal = nomeCompleto ?? 'nome nao preenchido';

  // if
  if (nomeCompleto != null) {
    print(nomeCompleto!.toUpperCase());
  } else {
    print('nome nao preenchido');
  }

  // conditional property access
  print(nomeCompleto?.toUpperCase() ?? 'nome nao preenchido');
}
