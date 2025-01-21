import 'package:chatapp/features/chat/data/datasources/remote_data_soruce/message_remote_data_source.dart';
import 'package:chatapp/features/chat/domain/entity/message_entity.dart';
import 'package:chatapp/features/chat/domain/repository/message_repository.dart';
import 'package:chatapp/features/conversation/data/datasource/remotedatasource/conversation_remote_data_soruce.dart';

class MessageRepositoryImpl implements MessageRepository{
  final MessageRemoteDataSource remoteDataSource;

  MessageRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<MessageEntity>> fetchMessage(String conversationId)async {
    return await remoteDataSource.fetchMessages(conversationId);
  }

  @override
  Future<void> sendMessage(String conversationId) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }

}