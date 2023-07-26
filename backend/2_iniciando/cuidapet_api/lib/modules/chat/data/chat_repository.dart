import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import '../../../application/database/i_database_connection.dart';
import '../../../application/exceptions/database_exception.dart';
import '../../../application/logger/i_logger.dart';
import '../../../entities/chat.dart';
import '../../../entities/device_token.dart';
import '../../../entities/supplier.dart';
import 'i_chat_repository.dart';

@LazySingleton(as: IChatRepository)
class ChatRepository implements IChatRepository {
  IDatabaseConnection connection;
  ILogger log;

  ChatRepository({
    required this.connection,
    required this.log,
  });

  @override
  Future<int> startChat(int scheduleId) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final result = await conn.query('''
        insert into chats(agendamento_id, status, data_criacao) values (?, ?, ?)
      ''', [
        scheduleId,
        'A',
        DateTime.now().toIso8601String(),
      ]);
      return result.insertId!;
    } on MySqlException catch (e, s) {
      log.error('Erro ao iniciar chat', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<Chat?> findChatById(int chatId) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final query = '''
        select c.id
              ,c.data_criacao
              ,c.status
              ,a.nome as agendamento_nome
              ,a.nome_pet as agendamento_nome_pet
              ,a.fornecedor_id
              ,a.usuario_id
              ,f.nome as fornecedor_nome
              ,f.logo
              ,u.android_token as user_android_token
              ,u.ios_token as user_ios_token
              ,uf.android_token as fornecedor_android_token
              ,uf.ios_token as fornecedor_ios_token
          from chats as c
          join agendamento a on a.id = c.agendamento_id
          join fornecedor f on f.id = a.fornecedor_id
          --   Dados do usuário Cliente do petshop
          join usuario u on u.id = a.usuario_id
          --   Dados do usuário fornecedor (O PETSHOP)
          join usuario uf on uf.fornecedor_id = f.id
         where c.id = ?
      ''';
      final result = await conn.query(query, [
        chatId,
      ]);

      if (result.isNotEmpty) {
        final resultMysql = result.first;
        return Chat(
          id: resultMysql['id'],
          status: resultMysql['status'],
          name: resultMysql['agendamento_nome'],
          petName: resultMysql['agendamento_nome_pet'],
          supplier: Supplier(
            id: resultMysql['fornecedor_id'],
            name: resultMysql['fornecedor_nome'],
          ),
          user: resultMysql['usuario_id'],
          userDeviceToken: DeviceToken(
            android: (resultMysql['user_android_token'] as Blob?)?.toString(),
            ios: (resultMysql['user_ios_token'] as Blob?)?.toString(),
          ),
          supplierDeviceToken: DeviceToken(
            android:
                (resultMysql['fornecedor_android_token'] as Blob?)?.toString(),
            ios: (resultMysql['fornecedor_ios_token'] as Blob?)?.toString(),
          ),
        );
      }
    } on MySqlException catch (e, s) {
      log.error('Erro ao buscar dados do chat', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
    return null;
  }

  @override
  Future<List<Chat>> findAllChatByUserId(int userId) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final query = '''
        select c.id
              ,c.data_criacao
              ,c.status
              ,a.nome
              ,a.nome_pet
              ,a.fornecedor_id
              ,a.usuario_id
              ,f.nome as fornecedor_nome
              ,f.logo
          from chats as c
          join agendamento a on a.id = c.agendamento_id
          join fornecedor f on f.id = a.fornecedor_id
         where a.usuario_id = ?
           and c.status = 'A'
         order by c.data_criacao
      ''';
      final result = await conn.query(query, [
        userId,
      ]);

      return result
          .map(
            (c) => Chat(
              id: c['id'],
              user: c['usuario_id'],
              supplier: Supplier(
                id: c['fornecedor_id'],
                name: c['fornecedor_nome'],
                logo: (c['logo'] as Blob?)?.toString(),
              ),
              name: c['nome'],
              petName: c['nome_pet'],
              status: c['status'],
            ),
          )
          .toList();
    } on MySqlException catch (e, s) {
      log.error('Erro ao buscar dados do chat pelo usuário id', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<List<Chat>> findAllChatBySupplierId(int supplierId) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final query = '''
        select c.id
              ,c.data_criacao
              ,c.status
              ,a.nome
              ,a.nome_pet
              ,a.fornecedor_id
              ,a.usuario_id
              ,f.nome as fornecedor_nome
              ,f.logo
          from chats as c
          join agendamento a on a.id = c.agendamento_id
          join fornecedor f on f.id = a.fornecedor_id
         where a.fornecedor_id = ?
           and c.status = 'A'
         order by c.data_criacao
      ''';
      final result = await conn.query(query, [
        supplierId,
      ]);

      return result
          .map(
            (c) => Chat(
              id: c['id'],
              user: c['usuario_id'],
              supplier: Supplier(
                id: c['fornecedor_id'],
                name: c['fornecedor_nome'],
                logo: (c['logo'] as Blob?)?.toString(),
              ),
              name: c['nome'],
              petName: c['nome_pet'],
              status: c['status'],
            ),
          )
          .toList();
    } on MySqlException catch (e, s) {
      log.error('Erro ao buscar dados do chat pelo fornecedor id', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<void> endChat(int chatId) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      await conn.query('''
        update chats
           set status = 'F'
         where id = ?
      ''', [
        chatId,
      ]);
    } on MySqlException catch (e, s) {
      log.error('Erro ao iniciar chat', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }
}
