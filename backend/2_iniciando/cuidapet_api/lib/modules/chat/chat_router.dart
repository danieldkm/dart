import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

import '../../application/routers/i_router.dart';
import 'controller/chat_controller.dart';

class ChatRouter implements IRouter {
  @override
  void configure(Router router) {
    final controller = GetIt.I.get<ChatController>();
    router.mount('/chats', controller.router);
  }
}
