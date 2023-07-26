import '../../../entities/chat.dart';
import '../view_models/chat_notify_view_model.dart';

abstract class IChatService {
  Future<int> startChat(int scheduleId);
  Future<void> notifyChat(ChatNotifyViewModel model);
  Future<List<Chat>> getChatsByUserId(int userId);
  Future<List<Chat>> getChatsBySupplierId(int supplierId);
  Future<void> endChat(int chatId);
}
