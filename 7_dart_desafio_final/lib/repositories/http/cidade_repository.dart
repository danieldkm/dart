import 'dart:convert';

import 'package:dart_desafio_final/estado.dart';
import 'package:http/http.dart';

import '../../cidade.dart';

class CidadeRepository {
  Future<List<Cidade>> findAll(int id_uf) async {
    final result = await get(
      Uri.parse(
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$id_uf/distritos',
      ),
    );

    if (result.statusCode >= 200 && result.statusCode < 300) {
      var resultData = jsonDecode(result.body);
      if (resultData is Map) {
        return List<Cidade>.from([Cidade.fromJson(resultData)]);
      } else if (resultData is List) {
        return List<Cidade>.from(
          resultData.map(
            (cidade) {
              (cidade as Map).putIfAbsent(
                'estado',
                () => {
                  'id': id_uf,
                },
              );
              return Cidade.fromJson(cidade);
            },
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
