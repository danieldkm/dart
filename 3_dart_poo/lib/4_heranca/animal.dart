abstract class Animal {
  String? tamanho;
  final int idade;
  final String nome;

  Animal({required this.idade, required this.nome});

  int recuperarIdade() {
    return idade;
  }

  int calcularIdadeHumana();
}
