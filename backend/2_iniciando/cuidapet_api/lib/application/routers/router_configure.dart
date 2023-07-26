import 'package:shelf_router/shelf_router.dart';

import '../../modules/categories/categories_router.dart';
import '../../modules/chat/chat_router.dart';
import '../../modules/schedules/schedule_router.dart';
import '../../modules/supplier/supplier_router.dart';
import '../../modules/user/user_router.dart';
import 'i_router.dart';

class RouterConfigure {
  final Router _router;
  final List<IRouter> _routers = [
    UserRouter(),
    CategoriesRouter(),
    SupplierRouter(),
    ScheduleRouter(),
    ChatRouter(),
  ];

  RouterConfigure(this._router);

  void configure() => _routers.forEach((r) => r.configure(_router));
}
