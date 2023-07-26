import 'package:injectable/injectable.dart';

import '../../../application/logger/i_logger.dart';
import '../../../entities/schedule.dart';
import '../../../entities/schedule_supplier_service.dart';
import '../../../entities/supplier.dart';
import '../../../entities/supplier_service.dart';
import '../data/i_schedule_repository.dart';
import '../view_models/schedule_save_input_model.dart';
import 'i_schedule_service.dart';

@LazySingleton(as: IScheduleService)
class ScheduleService implements IScheduleService {
  final IScheduleRepository repository;
  final ILogger log;

  ScheduleService({
    required this.repository,
    required this.log,
  });

  @override
  Future<void> save(ScheduleSaveInputModel model) async {
    final schedule = Schedule(
      status: 'P',
      scheduleDate: model.scheduleDate,
      name: model.name,
      petName: model.petName,
      supplier: Supplier(id: model.supplierId),
      userId: model.userId,
      services: model.services
          .map(
            (e) => ScheduleSupplierService(
              service: SupplierService(id: e),
            ),
          )
          .toList(),
    );

    await repository.save(schedule);
  }

  @override
  Future<void> changeStatus(String status, int scheduleId) =>
      repository.changeStatus(status, scheduleId);

  @override
  Future<List<Schedule>> findAllSchedulesByUser(int userId) =>
      repository.findAllByUser(userId);

  @override
  Future<List<Schedule>> findAllSchedulesByUserSupplier(int userId) =>
      repository.findAllByUserSupplier(userId);
}
