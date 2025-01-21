import 'package:chatapp/features/chat/domain/entity/message_entity.dart';
import 'package:chatapp/features/chat/domain/repository/message_repository.dart';

class FetchMessageUseCase {
  final MessageRepository repository;

  FetchMessageUseCase({required this.repository});

  Future<List<MessageEntity>> call(String conversationId) async {
    return await repository.fetchMessage(conversationId);
  }
}
