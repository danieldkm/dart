import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import '../../../application/database/i_database_connection.dart';
import '../../../application/exceptions/database_exception.dart';
import '../../../application/exceptions/user_exists_exception.dart';
import '../../../application/exceptions/user_not_found_exception.dart';
import '../../../application/helpers/crypt_utils.dart';
import '../../../application/logger/i_logger.dart';
import '../../../entities/user.dart';
import '../view_models/platform.dart';
import 'i_user_repository.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IDatabaseConnection connection;
  final ILogger log;

  UserRepository({
    required this.connection,
    required this.log,
  });

  @override
  Future<User> createUser(User user) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final query = '''
        insert usuario(email, tipo_cadastro, img_avatar, senha, fornecedor_id, social_id)
        values (?,?,?,?,?,?)
      ''';

      final result = await conn.query(query, [
        user.email,
        user.registerType,
        user.imageAvatar,
        CryptUtils.generateSha256Hash(user.password ?? ''),
        user.supplierId,
        user.socialKey,
      ]);

      final userId = result.insertId;

      return user.copyWith(id: userId, password: null);
    } on MySqlException catch (e, s) {
      if (e.message.contains('usuario.email_UNIQUE')) {
        log.error('Usuário já cadastrado na base de dados', e, s);
        throw UserExistsException();
      }
      log.error('Erro ao criar usuário', e, s);
      throw DatabaseException(message: 'Erro ao criar usuário', exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<User> loginWithEmailAndPassword(
      String email, String password, bool supplierUser) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      var query = '''
        select * 
          from usuario 
         where email = ? 
           and senha = ?
      ''';

      if (supplierUser) {
        query += ' and fornecedor_id is not null';
      } else {
        query += ' and fornecedor_id is null';
      }

      final result = await conn.query(query, [
        email,
        CryptUtils.generateSha256Hash(password),
      ]);

      if (result.isEmpty) {
        log.error('Usuário ou senha inválidos!!!');
        throw UserNotFoundException(message: 'Usuário ou senha inválidos');
      }
      // } else {
      final userSqlData = result.first;
      return User(
        id: userSqlData['id'] as int,
        email: userSqlData['email'],
        registerType: userSqlData['tipo_cadastro'],
        iosToken: (userSqlData['ios_token'] as Blob?).toString(),
        androidToken: (userSqlData['android_token'] as Blob?).toString(),
        refreshToken: (userSqlData['refresh_token'] as Blob?).toString(),
        imageAvatar: (userSqlData['img_avatar'] as Blob?).toString(),
        supplierId: userSqlData['fornecedor_id'],
      );
      // }
    } on MySqlException catch (e, s) {
      log.error('Erro ao realizar login', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<User> loginByEmailSocialKey(
    String email,
    String socialkey,
    String socialtype,
  ) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final result =
          await conn.query('select * from usuario where email = ?', [email]);

      if (result.isEmpty) {
        throw UserNotFoundException(message: 'Usuário não encontrado');
      }

      final dataMysql = result.first;
      if (dataMysql['social_id'] == null ||
          dataMysql['social_id'] != socialkey) {
        await conn.query('''
          update usuario 
             set social_id = ?
                ,tipo_cadastro = ? 
           where id = ?
        ''', [
          socialkey,
          socialtype,
          dataMysql['id'],
        ]);
      }

      return User(
        id: dataMysql['id'] as int,
        email: dataMysql['email'],
        registerType: dataMysql['tipo_cadastro'],
        iosToken: (dataMysql['ios_token'] as Blob?).toString(),
        androidToken: (dataMysql['android_token'] as Blob?).toString(),
        refreshToken: (dataMysql['refresh_token'] as Blob?).toString(),
        imageAvatar: (dataMysql['img_avatar'] as Blob?).toString(),
        supplierId: dataMysql['fornecedor_id'],
      );
    } on MySqlException catch (e, s) {
      log.error('Erro ao realizar login com rede social', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<void> updateUserDeviceTokenAndRefreshToken(User user) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final setParams = {};

      if (user.iosToken != null) {
        setParams.putIfAbsent('ios_token', () => user.iosToken);
      } else {
        setParams.putIfAbsent('android_token', () => user.androidToken);
      }

      final query = '''
        update usuario
           set ${setParams.keys.elementAt(0)} = ?
              ,refresh_token = ?
         where id = ?
      ''';

      await conn.query(
        query,
        [
          setParams.values.elementAt(0),
          user.refreshToken!,
          user.id!,
        ],
      );
    } on MySqlException catch (e, s) {
      log.error('Erro ao confirmar login', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<void> updateRefreshToken(User user) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      await conn.query(
        'update usuario set refresh_token = ? where id = ?',
        [
          user.refreshToken!,
          user.id!,
        ],
      );
    } on MySqlException catch (e, s) {
      log.error('Erro ao atualizar refresh token', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<User> findById(int id) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final result = await conn.query(
        '''
        select id
              ,email
              ,tipo_cadastro
              ,ios_token
              ,android_token
              ,refresh_token
              ,img_avatar
              ,fornecedor_id
          from usuario 
         where id = ?
      ''',
        [id],
      );
      if (result.isEmpty) {
        throw UserNotFoundException(message: 'Usuário não encontrado');
      }
      final userSqlData = result.first;
      return User(
        id: userSqlData['id'] as int,
        email: userSqlData['email'],
        registerType: userSqlData['tipo_cadastro'],
        iosToken: (userSqlData['ios_token'] as Blob?).toString(),
        androidToken: (userSqlData['android_token'] as Blob?).toString(),
        refreshToken: (userSqlData['refresh_token'] as Blob?).toString(),
        imageAvatar: (userSqlData['img_avatar'] as Blob?).toString(),
        supplierId: userSqlData['fornecedor_id'],
      );
    } on MySqlException catch (e, s) {
      log.error('Erro ao buscar usuário por id', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<void> updateUrlAvatar(int id, String urlAvatar) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      await conn.query(
        'update usuario set img_avatar = ? where id = ?',
        [
          urlAvatar,
          id,
        ],
      );
    } on MySqlException catch (e, s) {
      log.error('Erro ao atualizar o avatar', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<void> updateDeviceToken(
    int id,
    String token,
    Platform platform,
  ) async {
    late final MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      var set = '';
      if (platform == Platform.ios) {
        set = 'ios_token = ?';
      } else {
        set = 'android_token = ?';
      }

      final query = 'update usuario set $set where id = ?';
      await conn.query(
        query,
        [
          token,
          id,
        ],
      );
    } on MySqlException catch (e, s) {
      log.error('Erro ao atualizar o device token', e, s);
      throw DatabaseException(message: e.message, exception: e);
    } finally {
      await conn?.close();
    }
  }
}
