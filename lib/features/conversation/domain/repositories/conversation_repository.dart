import 'package:chatapp/features/conversation/domain/entities/conversation_entity.dart';

abstract class ConversationRepository {
 Future<List<ConversationEntity>> fetchConversations();
}


class ConversationRepositoryImpl extends ConversationRepository{
  @override
  Future<List<ConversationEntity>> fetchConversations() {
    throw UnimplementedError();
  }

}