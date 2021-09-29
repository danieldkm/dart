import 'package:http/http.dart';

import '../models/cidade.dart';

class CidadeRepository {
  Future<Cidade> buscarCidade(String cep) async {
    var url = 'https://viacep.com.br/ws/$cep/json/';
    var response = await get(Uri.parse(url));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Cidade.fromJson(response.body);
    }
    return throw Exception(response.reasonPhrase);
  }
}
