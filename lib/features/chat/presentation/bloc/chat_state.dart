import 'package:chatapp/features/chat/domain/entity/message_entity.dart';

abstract class ChatState {}

class ChatLoadedState extends ChatState {
  final List<MessageEntity> messages;

  ChatLoadedState(this.messages);
}

class ChatErrorState extends ChatState {
  final String message;

  ChatErrorState(this.message);
}

class ChatLoadingState extends ChatState {}
