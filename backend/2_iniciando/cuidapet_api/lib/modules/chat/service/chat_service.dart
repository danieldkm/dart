import 'package:injectable/injectable.dart';

import '../../../application/facades/push_notification_facade.dart';
import '../../../application/logger/i_logger.dart';
import '../../../entities/chat.dart';
import '../data/i_chat_repository.dart';
import '../view_models/chat_notify_view_model.dart';
import 'i_chat_service.dart';

@LazySingleton(as: IChatService)
class ChatService implements IChatService {
  final IChatRepository repository;
  final ILogger log;
  final PushNotificationFacade pushNotificationFacade;

  ChatService({
    required this.repository,
    required this.log,
    required this.pushNotificationFacade,
  });
  @override
  Future<int> startChat(int scheduleId) => repository.startChat(scheduleId);

  @override
  Future<void> notifyChat(ChatNotifyViewModel model) async {
    final chat = await repository.findChatById(model.chatId);

    if (chat != null) {
      switch (model.notificationUseType) {
        case NotificationUseType.user:
          _notifyUser(chat.userDeviceToken?.tokens, model, chat);
          break;
        case NotificationUseType.supplier:
          _notifyUser(chat.supplierDeviceToken?.tokens, model, chat);
          break;
        default:
          throw Exception('Tipo de notificação não encontrada');
      }
    }
  }

  void _notifyUser(
      List<String?>? tokens, ChatNotifyViewModel model, Chat chat) {
    final Map<String, dynamic> payload = {
      'type': 'CHAT_MESSAGE',
      'chat': {
        'id': chat.id,
        'nome': chat.name,
        'fornecedor': {
          'nome': chat.supplier.name,
          'logo': chat.supplier.logo,
        },
      },
    };

    pushNotificationFacade.sendMessage(
      devices: tokens ?? [],
      title: 'Nova mensagem',
      body: model.message,
      payload: payload,
    );
  }

  @override
  Future<List<Chat>> getChatsByUserId(int userId) =>
      repository.findAllChatByUserId(userId);

  @override
  Future<List<Chat>> getChatsBySupplierId(int supplierId) =>
      repository.findAllChatBySupplierId(supplierId);

  @override
  Future<void> endChat(int chatId) => repository.endChat(chatId);
}
