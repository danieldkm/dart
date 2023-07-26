// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/categories/controller/categories_controller.dart' as _i32;
import '../../modules/categories/data/categories_repository.dart' as _i22;
import '../../modules/categories/data/i_categories_repository.dart' as _i21;
import '../../modules/categories/service/categories_service.dart' as _i24;
import '../../modules/categories/service/i_categories_service.dart' as _i23;
import '../../modules/chat/controller/chat_controller.dart' as _i33;
import '../../modules/chat/data/chat_repository.dart' as _i26;
import '../../modules/chat/data/i_chat_repository.dart' as _i25;
import '../../modules/chat/service/chat_service.dart' as _i28;
import '../../modules/chat/service/i_chat_service.dart' as _i27;
import '../../modules/schedules/controller/scheduler_controller.dart' as _i18;
import '../../modules/schedules/data/i_schedule_repository.dart' as _i6;
import '../../modules/schedules/data/schedule_repository.dart' as _i7;
import '../../modules/schedules/service/i_schedule_service.dart' as _i9;
import '../../modules/schedules/service/schedule_service.dart' as _i10;
import '../../modules/supplier/controller/supplier_controller.dart' as _i31;
import '../../modules/supplier/data/i_supplier_repository.dart' as _i11;
import '../../modules/supplier/data/supplier_repository.dart' as _i12;
import '../../modules/supplier/service/i_supplier_service.dart' as _i29;
import '../../modules/supplier/service/supplier_service.dart' as _i30;
import '../../modules/user/controller/auth_controller.dart' as _i20;
import '../../modules/user/controller/user_controller.dart' as _i19;
import '../../modules/user/data/i_user_repository.dart' as _i13;
import '../../modules/user/data/user_repository.dart' as _i14;
import '../../modules/user/service/i_user_service.dart' as _i15;
import '../../modules/user/service/user_service.dart' as _i16;
import '../database/database_connection.dart' as _i4;
import '../database/i_database_connection.dart' as _i3;
import '../facades/push_notification_facade.dart' as _i17;
import '../logger/i_logger.dart' as _i8;
import 'database_connection_configuration.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.IDatabaseConnection>(() =>
        _i4.DatabaseConnection(gh<_i5.DatabaseConnectionConfiguration>()));
    gh.lazySingleton<_i6.IScheduleRepository>(() => _i7.ScheduleRepository(
          connection: gh<_i3.IDatabaseConnection>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.lazySingleton<_i9.IScheduleService>(() => _i10.ScheduleService(
          repository: gh<_i6.IScheduleRepository>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.lazySingleton<_i11.ISupplierRepository>(() => _i12.SupplierRepository(
          connection: gh<_i3.IDatabaseConnection>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.lazySingleton<_i13.IUserRepository>(() => _i14.UserRepository(
          connection: gh<_i3.IDatabaseConnection>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.lazySingleton<_i15.IUserService>(() => _i16.UserService(
          userRepository: gh<_i13.IUserRepository>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.lazySingleton<_i17.PushNotificationFacade>(
        () => _i17.PushNotificationFacade(log: gh<_i8.ILogger>()));
    gh.factory<_i18.SchedulerController>(() => _i18.SchedulerController(
          service: gh<_i9.IScheduleService>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.factory<_i19.UserController>(() => _i19.UserController(
          userService: gh<_i15.IUserService>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.factory<_i20.AuthController>(() => _i20.AuthController(
          userService: gh<_i15.IUserService>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.lazySingleton<_i21.ICategoriesRepository>(
        () => _i22.CategoriesRepository(
              connection: gh<_i3.IDatabaseConnection>(),
              log: gh<_i8.ILogger>(),
            ));
    gh.lazySingleton<_i23.ICategoriesService>(() => _i24.CategoriesService(
          categoriesRepository: gh<_i21.ICategoriesRepository>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.lazySingleton<_i25.IChatRepository>(() => _i26.ChatRepository(
          connection: gh<_i3.IDatabaseConnection>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.lazySingleton<_i27.IChatService>(() => _i28.ChatService(
          repository: gh<_i25.IChatRepository>(),
          log: gh<_i8.ILogger>(),
          pushNotificationFacade: gh<_i17.PushNotificationFacade>(),
        ));
    gh.lazySingleton<_i29.ISupplierService>(() => _i30.SupplierService(
          supplierRepository: gh<_i11.ISupplierRepository>(),
          userService: gh<_i15.IUserService>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.factory<_i31.SupplierController>(() => _i31.SupplierController(
          service: gh<_i29.ISupplierService>(),
          log: gh<_i8.ILogger>(),
        ));
    gh.factory<_i32.CategoriesController>(() =>
        _i32.CategoriesController(service: gh<_i23.ICategoriesService>()));
    gh.factory<_i33.ChatController>(() => _i33.ChatController(
          service: gh<_i27.IChatService>(),
          log: gh<_i8.ILogger>(),
        ));
    return this;
  }
}
