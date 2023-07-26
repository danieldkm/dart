import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

import '../../application/routers/i_router.dart';
import 'controller/scheduler_controller.dart';

class ScheduleRouter implements IRouter {
  @override
  void configure(Router router) {
    final scheduleController = GetIt.I.get<SchedulerController>();
    router.mount('/schedules', scheduleController.router);
  }
}
