import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/shelf_router.dart';

import '../logger/i_logger.dart';
import '../logger/logger.dart';
import '../routers/router_configure.dart';
import 'database_connection_configuration.dart';
import 'service_locator_config.dart';

class ApplicationConfig {
  DotEnv? env;

  Future<void> loadConfigApplication(Router router) async {
    env = await _loadEnv();
    _loadDatabaseConfig();
    _configLogger();
    _loadDependencies();
    _loadRoutersConfigure(router);
  }

  Future<DotEnv> _loadEnv() async => DotEnv()..load();

  void _loadDatabaseConfig() {
    final databaseConfig = DatabaseConnectionConfiguration(
      host: env?['DATABASE_HOT'] ?? env!['databaseHost']!,
      user: env?['DATABASE_USER'] ?? env!['databaseUser']!,
      port: int.tryParse(env?['DATABASE_PORT'] ?? env!['databasePort']!) ?? 0,
      password: env?['DATABASE_PASSWORD'] ?? env!['databasePassword']!,
      databaseName: env?['DATABASE_NAME'] ?? env!['databaseName']!,
    );
    GetIt.I.registerSingleton(databaseConfig);
  }

  void _configLogger() => GetIt.I.registerLazySingleton<ILogger>(
        () => Logger(),
      );

  void _loadDependencies() => configureDependencies();

  void _loadRoutersConfigure(Router router) =>
      RouterConfigure(router).configure();
}
