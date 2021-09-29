import 'package:dart_async/8_repositories/repositories/cidade_repository.dart';
import 'package:dart_async/8_repositories/repositories/user_repository.dart';

void main(List<String> args) async {
  var cidadeRepository = CidadeRepository();
  var userRepository = UserRepository();

  try {
    var cidade = await cidadeRepository.buscarCidade('86200000');
    print(cidade);
    var users = await userRepository.findById(1);
    print(users ?? 'usuário não encontrado');
  } catch (e) {
    print(e);
  }
}
