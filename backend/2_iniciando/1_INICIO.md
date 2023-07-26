# Backend

## Criando projeto backend

ATENÇÃO
O stagehand foi descontinuado agora para a criação do projeto você deve utilizar o próprio Dart:

```bash
dart create -t server-shelf ./nome_projeto
```

```bash
dart run bin/server.dart
```

## Configurando variáveis locais (.env)

```bash
dart pub add dotenv
```

## Instalando o Mysql Local (imporante!)

Docker ocupa 3GB de memoria

[mysql](https://hub.docker.com/_/mysql)

Na maquina 300MB

[mysql community](https://dev.mysql.com/downloads/mysql/)
  - Configure MySQL Server
    - Use Legacy Password Encryption

## Criando classes de conexão com o banco de dados

```bash
dart pub add mysql1
```

```bash
dart pub add get_it
```

- lib\application\config\application_config.dart
- lib\application\config\database_connection_configuration.dart
- lib\application\database\database_connection.dart
- lib\application\database\i_database_connection.dart

## Configurando estrutura de Logs

```bash
dart pub add logger
```

- lib\application\logger\i_logger.dart
- lib\application\logger\logger.dart

## Configurando Service Locator (get_it, injectable)

```bash
dart pub add injectable
```

```bash
dart pub add dev:injectable_generator
```

```bash
dart pub add dev:build_runner
```

caso haja conflito de dependencias considere verificar a tag `dependency_overrides` ex:

```yaml
dependency_overrides:
  # Foi sobrescrito devido ao mysql1 não foi migrado ainda para o null-safety
  logging: ^1.0.0
  crypto: ^3.0.0
```

### Rodando o build_runner

```bash
dart run build_runner watch
```

ou

```bash
pub run build_runner watch
```

## Atualizando Shelf para null safety

```bash
dart pub add dev:shelf_router_generator
```

### Setando a dependencia via git

```yaml
dev_dependencies:
  ...
  shelf_router_generator:
    git:
      url: https://github.com/google/dart-neats.git
      path: shelf_router_generator
```

## Configurando estrutura de Rotas (Shelf-Router)

- lib\application\routers\i_router.dart
- lib\application\routers\router_configure.dart