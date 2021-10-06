import 'package:dart_desafio_final/database.dart';
import 'package:mysql1/mysql1.dart';

import '../../cidade.dart';

class CidadeRepository {
  MySqlConnection? connection;

  CidadeRepository({
    this.connection,
  });

  Future<void> dispose() async {
    await connection?.close();
  }

  Future<CidadeRepository> getInstance() async {
    var mysqlConnection = await _initConnection();
    return CidadeRepository(connection: mysqlConnection);
  }

  Future<MySqlConnection> _initConnection() async {
    final database = Database();
    return database.openConnection();
  }

  Future<List<Cidade>> notExists(List<Cidade> cidades) async {
    final bbCidades = await findAll();
    final novasCidades =
        cidades.fold<List<Cidade>>([], (previousValue, element) {
      if (bbCidades.every(
          (c) => c.estado.id != element.estado.id && c.nome != element.nome)) {
        previousValue.add(element);
      }
      return previousValue;
    });
    return novasCidades;
  }

  Future<void> addAll(List<Cidade> cidades) async {
    connection ??= await _initConnection();
    await connection!.transaction((_) async {
      var novasCidades = await notExists(cidades);
      for (var cidade in novasCidades) {
        await connection!.query(
          'insert into cidade (id_uf, nome) values (?,?)',
          [cidade.estado.id, cidade.nome],
        );
      }
    });
  }

  Future<List<Cidade>> findAll() async {
    connection ??= await _initConnection();

    var result = await connection!
        .query('select * from cidade join estado on estado.id = cidade.id_uf');
    return List<Cidade>.from(
      result.map(
        (cidade) => Cidade.fromJson(
          cidade.asMap(),
        ),
      ),
    );
  }
}
