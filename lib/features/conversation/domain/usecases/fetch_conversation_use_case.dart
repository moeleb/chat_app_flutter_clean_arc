import 'package:chatapp/features/conversation/domain/repositories/conversation_repository.dart';

import '../entities/conversation_entity.dart';

class FetchConversationUseCase {
  final ConversationRepository repository;

  FetchConversationUseCase(this.repository);

  Future<List<ConversationEntity>> call() async {
    return repository.fetchConversations();
  }
}
