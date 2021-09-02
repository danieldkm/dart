// Caracteristicas
// Comportamentos
class Camiseta {
  // Atributos
  String? tamanho;
  String? _cor;
  String? marca;

// atributos de classe
  static String nome = 'Camiseta';
  static const String _nome2 = 'Camiseta';

  // metodo de classe
  static String recuperarNome() => nome;
  static String _recuperar2Nome() => nome;

// Funcoes dentro de classes
// Sao chamados de metodos
  String tipoDeLavagem() {
    if (marca == 'Nike') {
      return 'Não pode lavar na máquina';
    } else {
      return 'Pode lavar na máquina';
    }
  }

  String? get cor => _cor;
  set cor(String? cor) {
    if (cor == 'Verde') {
      {
        throw Exception('Não pode ser Verde');
      }
    }
  }
}

class _Camiseta2 {
  void recuperarCor() {
    var camiseta = Camiseta();
    camiseta._cor = 'Verde';
  }
}
