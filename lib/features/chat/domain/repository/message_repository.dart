import 'package:chatapp/features/chat/domain/entity/message_entity.dart';

abstract class MessageRepository {
  Future<List<MessageEntity>> fetchMessage(String conversationId);

  Future<void> sendMessage(String conversationId);
}
