import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import '../../../application/database/i_database_connection.dart';
import '../../../application/exceptions/database_exception.dart';
import '../../../application/logger/i_logger.dart';
import '../../../entities/schedule.dart';
import '../../../entities/schedule_supplier_service.dart';
import '../../../entities/supplier.dart';
import '../../../entities/supplier_service.dart';
import 'i_schedule_repository.dart';

@LazySingleton(as: IScheduleRepository)
class ScheduleRepository implements IScheduleRepository {
  IDatabaseConnection connection;
  ILogger log;

  ScheduleRepository({
    required this.connection,
    required this.log,
  });

  @override
  Future<void> save(Schedule schedule) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      await conn.transaction((_) async {
        final result = await conn!.query('''
          insert into agendamento (data_agendamento, usuario_id, fornecedor_id, status, nome, nome_pet)
               values(?,?,?,?,?,?)
        ''', [
          schedule.scheduleDate.toIso8601String(),
          schedule.userId,
          schedule.supplier.id,
          schedule.status,
          schedule.name,
          schedule.petName,
        ]);

        final scheduleId = result.insertId;

        if (scheduleId != null) {
          await conn.queryMulti(
            'insert into agendamento_servicos values (?,?)',
            schedule.services.map(
              (e) => [scheduleId, e.service.id],
            ),
          );
        }
      });
    } on MySqlException catch (e, s) {
      log.error('Erro ao agendar serviço', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<void> changeStatus(String status, int scheduleId) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      await conn.query('''
        update agendamento
           set status = ?
         where id = ?
      ''', [status, scheduleId]);
    } on MySqlException catch (e, s) {
      log.error('Erro ao alterar status de um agendamento', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<List<Schedule>> findAllByUser(int userId) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final query = '''
        select a.id
              ,a.data_agendamento
              ,a.status
              ,a.nome
              ,a.nome_pet
              ,a.fornecedor_id
              ,f.nome fornecedor_nome
              ,f.logo
          from agendamento a
          join fornecedor f on f.id = a.fornecedor_id
         where usuario_id = ?
         order by a.data_agendamento desc
      ''';
      final result = await conn.query(query, [userId]);

      final scheduleResultFuture = await result.map(
        (s) async => Schedule(
          id: s['id'],
          scheduleDate: s['data_agendamento'],
          status: s['status'],
          name: s['nome'],
          petName: s['nome_pet'],
          userId: userId,
          supplier: Supplier(
              id: s['fornecedor_id'],
              logo: (s['logo'] as Blob?).toString(),
              name: s['fornecedor_nome']),
          services: await findAllServicesBySchedule(s['id']),
        ),
      );

      return Future.wait(scheduleResultFuture);
    } on MySqlException catch (e, s) {
      log.error('Erro ao buscar agendamentos de usuário', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  Future<List<ScheduleSupplierService>> findAllServicesBySchedule(
      int scheduleId) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final query = '''
        select fos.id
              ,fos.nome_servico
              ,fos.valor_servico
              ,fos.fornecedor_id
          from agendamento_servicos ags
          join fornecedor_servicos fos on fos.id = ags.fornecedor_servicos_id
         where ags.agendamento_id = ?
      ''';
      final result = await conn.query(query, [scheduleId]);

      return result
          .map(
            (s) => ScheduleSupplierService(
              service: SupplierService(
                id: s['id'],
                name: s['nome_servico'],
                price: s['valor_servico'],
                supplierId: s['fornecedor_id'],
              ),
            ),
          )
          .toList();
    } on MySqlException catch (e, s) {
      log.error('Erro ao buscar os servicos de um agendamento', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<List<Schedule>> findAllByUserSupplier(int userId) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final query = '''
        select a.id
              ,a.data_agendamento
              ,a.status
              ,a.nome
              ,a.nome_pet
              ,a.fornecedor_id
              ,f.nome fornecedor_nome
              ,f.logo
          from agendamento a
          join fornecedor f on f.id = a.fornecedor_id
          join usuario u on u.fornecedor_id = f.id
         where u.id = ?
         order by a.data_agendamento desc
      ''';
      final result = await conn.query(query, [userId]);

      final scheduleResultFuture = await result.map(
        (s) async => Schedule(
          id: s['id'],
          scheduleDate: s['data_agendamento'],
          status: s['status'],
          name: s['nome'],
          petName: s['nome_pet'],
          userId: userId,
          supplier: Supplier(
              id: s['fornecedor_id'],
              logo: (s['logo'] as Blob?).toString(),
              name: s['fornecedor_nome']),
          services: await findAllServicesBySchedule(s['id']),
        ),
      );

      return Future.wait(scheduleResultFuture);
    } on MySqlException catch (e, s) {
      log.error('Erro ao buscar agendamentos de usuário', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }
}
