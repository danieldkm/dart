import 'package:dart_desafio_final/database.dart';
import 'package:mysql1/mysql1.dart';

import '../../estado.dart';

class EstadoRepository {
  MySqlConnection? connection;

  EstadoRepository({
    this.connection,
  });

  Future<void> dispose() async {
    await connection?.close();
  }

  Future<EstadoRepository> getInstance() async {
    var mysqlConnection = await _initConnection();
    return EstadoRepository(connection: mysqlConnection);
  }

  Future<MySqlConnection> _initConnection() async {
    final database = Database();
    return database.openConnection();
  }

  Future<List<Estado>> notExists(List<Estado> estados) async {
    final bdEstados = await findAll();
    final estado = estados.fold<List<Estado>>([], (previousValue, element) {
      // if (bdEstados
      //     .every((e) => e.nome == element.nome && e.uf == element.uf)) {
      if (!bdEstados.contains(element)) {
        previousValue.add(element);
      }
      return previousValue;
    });
    return estado;
  }

  Future<void> addAll(List<Estado> estados) async {
    connection ??= await _initConnection();
    await connection!.transaction((_) async {
      var novosEstados = await notExists(estados);
      for (var estado in novosEstados) {
        await connection!.query(
          'insert into estado (id, uf, nome) values (?,?,?)',
          [estado.id, estado.uf, estado.nome],
        );
      }
    });
  }

  Future<List<Estado>> findAll() async {
    connection ??= await _initConnection();

    var result = await connection!.query('select * from estado');
    return List<Estado>.from(
      result.map(
        (estado) => Estado.fromJson(
          estado.asMap(),
        ),
      ),
    );
  }
}
