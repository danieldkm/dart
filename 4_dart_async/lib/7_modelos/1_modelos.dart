import 'package:dart_async/7_modelos/cidade.dart';
import 'package:dart_async/7_modelos/user.dart';
import 'package:dart_async/7_modelos/user_mais_facil.dart';
import 'package:http/http.dart';

void main(List<String> args) {
  // buscarCep('01001000');
  buscarUser();
}

Future<void> buscarCep(cep) async {
  var url = 'https://viacep.com.br/ws/${cep}/json/';
  var response = await get(Uri.parse(url));

  if (response.statusCode >= 200 && response.statusCode < 300) {
    // var responseData = jsonDecode(response.body);
    // if (responseData is Map) {
    //   print(responseData['cep']);
    //   print(responseData['logradouro']);
    // }
    var cidade = Cidade.fromJson(response.body);
    print(cidade);

    print(cidade.toMap());
    print(cidade.toJson());
  }
}

Future<void> buscarUser() async {
  var url = 'https://5f7cba02834b5c0016b058aa.mockapi.io/api/users/1';
  var response = await get(Uri.parse(url));
  if (response.statusCode >= 200 && response.statusCode < 300) {
    print(response.body);
    // var user = User.fromJson(response.body);
    var user = UserMaisFacil.fromJson(response.body);
    print(user);
    print(user.toMap());
    print(user.toJson());
  }
}
