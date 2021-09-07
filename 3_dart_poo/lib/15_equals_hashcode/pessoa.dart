/// Pessoa
///   nome: Daniel
///   email: danielmorita@hotmail.com
///
/// Pessoa
///   nome: Joao
///   email: joao@hotmail.com
///
class Pessoa {
  String nome;
  String email;
  String telefone;
  Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
  });

// Forma 1
  // @override
  // bool operator ==(Object other) {
  //   // Validar se é a mesma referencia de memoria
  //   // metodo identical do dart ja faz essa validação
  //   if (identical(this, other)) return true;

  //   if (other is Pessoa) {
  //     if (other.nome == nome) {
  //       if (other.email == email) {
  //         return true;
  //       } else {
  //         return false;
  //       }
  //     } else {
  //       return false;
  //     }
  //   } else {
  //     return false;
  //   }
  // }

// Forma 2
  // @override
  // bool operator ==(Object other) {
  //   // Validar se é a mesma referencia de memoria
  //   // metodo identical do dart ja faz essa validação
  //   if (identical(this, other)) return true;

  //   var isEquals = false;

  //   if (other is Pessoa) {
  //     if (other.nome == nome) {
  //       if (other.email == email) {
  //         isEquals = true;
  //       }
  //     }
  //   }
  //   return isEquals;
  // }

  // @override
  // bool operator ==(Object other) {
  //   // Validar se é a mesma referencia de memoria
  //   // metodo identical do dart ja faz essa validação
  //   if (identical(this, other)) return true;
  //   return other is Pessoa && other.nome == nome && other.email == email;
  // }

  // @override
  // int get hashCode {
  //   // ^ soma de bits
  //   return nome.hashCode ^ email.hashCode;
  // }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pessoa &&
        other.nome == nome &&
        other.email == email &&
        other.telefone == telefone;
  }

  @override
  int get hashCode => nome.hashCode ^ email.hashCode ^ telefone.hashCode;

  @override
  String toString() =>
      'Pessoa(nome: $nome, email: $email, telefone: $telefone)';
}
