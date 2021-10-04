import 'package:dart_banco_dados/database.dart';
import 'package:mysql1/mysql1.dart';

void main(List<String> args) async {
  final database = Database();
  var mysqlConnection = await database.openConnection();

  // var resultado = await mysqlConnection.query(
  //   'insert into aluno (id, nome) value (?,?)',
  //   [
  //     null,
  //     'Daniel Morita',
  //   ],
  // );

  // print(resultado.affectedRows);

  // await mysqlConnection.query(
  //   'insert into aluno (id, nome) value (?,?)',
  //   [
  //     null,
  //     'Daniel Morita',
  //   ],
  // );
  await mysqlConnection.query(
      'update aluno set nome = ? where id = ?', ['Daniel Morita updated', 1]);
  final resultadoSelect = await mysqlConnection.query('select * from aluno');
  resultadoSelect.forEach((row) {
    print(row);
    print('Resultado por Indice');
    print(row[0]);
    print(row[1]);
    print('Resultado pelo nome da coluna');
    print(row['id']);
    print(row['nome']);
  });

  final resultadoSelectUnico =
      await mysqlConnection.query('select * from aluno where id = ?', [1]);
  if (resultadoSelectUnico.isNotEmpty) {
    final rowUnico = resultadoSelectUnico.first;
    print(rowUnico);
    print('Resultado unico por Indice');
    print(rowUnico[0]);
    print(rowUnico[1]);
    print('Resultado unico pelo nome da coluna');
    print(rowUnico['id']);
    print(rowUnico['nome']);
  }

  try {
    await mysqlConnection.query(
        'update aluno set nome = ? where id = ?', [1, 'Daniel Morita updated']);
  } on MySqlException catch (e) {
    print('Erro ao atualizar dados so aluno');
  }

  await mysqlConnection.transaction((conn) {});
}
