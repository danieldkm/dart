// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduler_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$SchedulerControllerRouter(SchedulerController service) {
  final router = Router();
  router.add(
    'POST',
    r'/',
    service.scheduleservices,
  );
  router.add(
    'PUT',
    r'/<scheduleId|[0-9]+>/status/<status>',
    service.changeStatus,
  );
  router.add(
    'GET',
    r'/',
    service.findAllSchedulesByUser,
  );
  router.add(
    'GET',
    r'/supplier',
    service.findAllSchedulesBySupplier,
  );
  return router;
}
