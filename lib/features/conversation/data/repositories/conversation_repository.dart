import 'package:chatapp/features/conversation/data/datasource/remotedatasource/conversation_remote_data_soruce.dart';
import 'package:chatapp/features/conversation/domain/entities/conversation_entity.dart';
import 'package:chatapp/features/conversation/domain/repositories/conversation_repository.dart';

class ConversationRepositoryImpl extends ConversationRepository {
  final ConversationRemoteDataSource remoteDataSource;

  ConversationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ConversationEntity>> fetchConversations() async {
    return await remoteDataSource.fetchConversations();
  }
}
