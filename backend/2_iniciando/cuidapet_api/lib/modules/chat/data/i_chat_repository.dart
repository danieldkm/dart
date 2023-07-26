import '../../../entities/chat.dart';

abstract class IChatRepository {
  Future<int> startChat(int scheduleId);
  Future<Chat?> findChatById(int chatId);
  Future<List<Chat>> findAllChatByUserId(int userId);
  Future<List<Chat>> findAllChatBySupplierId(int supplierId);
  Future<void> endChat(int chatId);
}
