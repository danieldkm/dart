import '../../../entities/schedule.dart';
import '../view_models/schedule_save_input_model.dart';

abstract class IScheduleService {
  Future<void> save(ScheduleSaveInputModel model);
  Future<void> changeStatus(String status, int scheduleId);
  Future<List<Schedule>> findAllSchedulesByUser(int userId);
  Future<List<Schedule>> findAllSchedulesByUserSupplier(int userId);
}
