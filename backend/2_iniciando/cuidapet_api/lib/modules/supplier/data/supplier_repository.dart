import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import '../../../application/database/i_database_connection.dart';
import '../../../application/dtos/supplier_nearby_me_dto.dart';
import '../../../application/exceptions/database_exception.dart';
import '../../../application/logger/i_logger.dart';
import '../../../entities/category.dart';
import '../../../entities/supplier.dart';
import '../../../entities/supplier_service.dart';
import 'i_supplier_repository.dart';

@LazySingleton(as: ISupplierRepository)
class SupplierRepository implements ISupplierRepository {
  IDatabaseConnection connection;
  ILogger log;

  SupplierRepository({
    required this.connection,
    required this.log,
  });
  @override
  Future<List<SupplierNearbyMeDto>> findNearByPosition(
    double lat,
    double lng,
    int distance,
  ) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final query = '''
        select f.id
              ,f.nome
              ,f.logo
              ,f.categorias_fornecedor_id
              ,(6371 * 
                acos( 
                  cos(radians($lat)) * 
                  cos(radians(ST_X(f.latlng))) * 
                  cos(radians($lng) - radians(ST_Y(f.latlng))) + 
                  sin(radians($lat)) * 
                  sin(radians(ST_X(f.latlng)))
                )
              ) As distancia 
          from fornecedor f 
        having distancia <= $distance
         order by distancia
      ''';
      final result = await conn.query(query);
      if (result.isNotEmpty) {
        return result
            .map((e) => SupplierNearbyMeDto(
                  id: e['id'],
                  name: e['nome'],
                  logo: (e['logo'] as Blob?)?.toString(),
                  distance: e['distancia'],
                  categoryId: e['categorias_fornecedor_id'],
                ))
            .toList();
      }
      return [];
    } on MySqlException catch (e, s) {
      log.error('Erro ao buscar fornecedores perto de mim', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<Supplier?> findById(int id) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final query = '''
        select f.id
              ,f.nome
              ,f.logo
              ,f.endereco
              ,f.telefone
              ,ST_X(f.latlng) as lat
              ,ST_Y(f.latlng) as lng
              ,f.categorias_fornecedor_id
              ,c.nome_categoria
              ,c.tipo_categoria
          from fornecedor f 
          join categorias_fornecedor c on c.id = f.categorias_fornecedor_id
         where f.id = ?
      ''';
      final result = await conn.query(query, [id]);

      if (result.isNotEmpty) {
        final data = result.first;
        return Supplier(
          id: data['id'],
          name: data['nome'],
          logo: (data['logo'] as Blob?)?.toString(),
          address: data['endereco'],
          phone: data['telefone'],
          lat: data['lat'],
          lng: data['lng'],
          category: Category(
            id: data['categorias_fornecedor_id'],
            name: data['nome_categoria'],
            type: data['tipo_categoria'],
          ),
        );
      }
      return null;
    } on MySqlException catch (e, s) {
      log.error('Erro ao buscar fornecedor por id', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<List<SupplierService>> findServicesBySupplierId(int supplierId) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final query = '''
        select id
              ,fornecedor_id
              ,nome_servico
              ,valor_servico
          from fornecedor_servicos
         where fornecedor_id = ?
      ''';
      final result = await conn.query(query, [supplierId]);

      if (result.isEmpty) {
        return [];
      }
      return result
          .map((s) => SupplierService(
                id: s['id'],
                supplierId: s['fornecedor_id'],
                name: s['nome_servico'],
                price: s['valor_servico'],
              ))
          .toList();
    } on MySqlException catch (e, s) {
      log.error('Erro ao buscar serviços de um fornecedor por id', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<bool> checkUserEmailExists(String email) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final result = await conn.query(
        'select count(*) from usuario where email = ?',
        [email],
      );

      final dataMySql = result.first;

      return dataMySql[0] > 0;
    } on MySqlException catch (e, s) {
      log.error('Erro ao verificar se login existe', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<int> saveSupplier(Supplier supplier) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final result = await conn.query(
        '''
          insert into fornecedor (nome
                                ,logo
                                ,endereco
                                ,telefone
                                ,latlng
                                ,categorias_fornecedor_id)
          values (?,?,?,?,ST_GeomfromText(?),?)
        ''',
        [
          supplier.name,
          supplier.logo,
          supplier.address,
          supplier.phone,
          'POINT(${supplier.lat ?? 0} ${supplier.lng ?? 0})',
          supplier.category?.id,
        ],
      );

      return result.insertId ?? 0;
    } on MySqlException catch (e, s) {
      log.error('Erro ao cadastrar novo fornecedor', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<Supplier> update(Supplier supplier) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      await conn.query(
        '''
          update fornecedor 
             set nome = ?
                ,logo = ?
                ,endereco = ?
                ,telefone = ?
                ,latlng = ST_GeomFromText(?)
                ,categorias_fornecedor_id = ?
           where id = ?
        ''',
        [
          supplier.name,
          supplier.logo,
          supplier.address,
          supplier.phone,
          'POINT(${supplier.lat ?? 0} ${supplier.lng ?? 0})',
          supplier.category?.id,
          supplier.id,
        ],
      );

      Category? category;
      final categoryId = supplier.category?.id;
      if (categoryId != null) {
        final resultCategory = await conn.query(
          'select * from categorias_fornecedor where id = ?',
          [categoryId],
        );

        var categoryData = resultCategory.first;
        category = Category(
          id: categoryData['id'],
          name: categoryData['nome_categoria'],
          type: categoryData['tipo_categoria'],
        );
      }
      return supplier.copyWith(category: category);
    } on MySqlException catch (e, s) {
      log.error('Erro ao atualizar dados do fornecedor', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }
}
