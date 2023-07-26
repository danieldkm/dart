import '../../../entities/schedule.dart';

abstract class IScheduleRepository {
  Future<void> save(Schedule schedule);
  Future<void> changeStatus(String status, int scheduleId);
  Future<List<Schedule>> findAllByUser(int userId);
  Future<List<Schedule>> findAllByUserSupplier(int userId);
}
