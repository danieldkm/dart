import 'dart:convert';

import 'package:http/http.dart';

import '../../estado.dart';

class EstadoRepository {
  Future<List<Estado>> findAll() async {
    final result = await get(
      Uri.parse('https://servicodados.ibge.gov.br/api/v1/localidades/estados'),
    );

    if (result.statusCode >= 200 && result.statusCode < 300) {
      var resultData = jsonDecode(result.body);
      if (resultData is Map) {
        return List<Estado>.from([Estado.fromJson(resultData)]);
      } else if (resultData is List) {
        return List<Estado>.from(
          resultData.map(
            (estado) => Estado.fromJson(estado),
          ),
        );
      }
      return [];
    } else {
      print('Ocorreu um problema mensagem ${result.reasonPhrase}');
      return [];
    }
  }
}
