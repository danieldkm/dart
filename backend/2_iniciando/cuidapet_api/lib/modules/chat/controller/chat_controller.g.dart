// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ChatControllerRouter(ChatController service) {
  final router = Router();
  router.add(
    'POST',
    r'/schedule/<scheduleId>/start-chat',
    service.startChatByScheduleId,
  );
  router.add(
    'POST',
    r'/notify',
    service.notifyUser,
  );
  router.add(
    'GET',
    r'/user',
    service.findChatByUser,
  );
  router.add(
    'GET',
    r'/supplier',
    service.findChasBySupplier,
  );
  router.add(
    'PUT',
    r'/<chatId>/end-chat',
    service.endChat,
  );
  return router;
}
