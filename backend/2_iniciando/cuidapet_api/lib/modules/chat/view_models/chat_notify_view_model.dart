import '../../../application/helpers/request_mapping.dart';

enum NotificationUseType { user, supplier }

class ChatNotifyViewModel extends RequestMapping {
  late int chatId;
  late String message;
  late NotificationUseType notificationUseType;

  ChatNotifyViewModel({super.dataRequest});

  @override
  void map() {
    chatId = data['chat_id'];
    message = data['message'];
    String notificationTypeRq = data['to'];
    notificationUseType = notificationTypeRq.toLowerCase() == 'u'
        ? NotificationUseType.user
        : NotificationUseType.supplier;
  }
}
