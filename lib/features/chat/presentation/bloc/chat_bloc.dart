import 'dart:async';

import 'package:chatapp/features/chat/domain/entity/message_entity.dart';
import 'package:chatapp/features/chat/domain/usecase/fetch_message_use_case.dart';
import 'package:chatapp/features/chat/presentation/bloc/chat_event.dart';
import 'package:chatapp/features/chat/presentation/bloc/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/socket_service.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FetchMessageUseCase fetchMessageUseCase;
  final SocketService _socketService = SocketService();
  final List<MessageEntity> _messages = [];
  final _storage = const FlutterSecureStorage();

  ChatBloc({required this.fetchMessageUseCase}) : super(ChatLoadingState()) {
    on<LoadMessagesEvent>(_onLoadMessages);
    on<SendMessageEvent>(_onSendMessage);
    on<RecieveMessageEvent>(_onRecieveMessage);
  }

  FutureOr<void> _onLoadMessages(
      LoadMessagesEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoadingState());
    try {
      final messages = await fetchMessageUseCase(event.conversationId);
      _messages.addAll(messages);
      emit(ChatLoadedState(_messages));
      _socketService.socket.emit('joinConversation', event.conversationId);
      _socketService.socket.on('newMessage', (data) {
        print("step 1 received Message $data");
        add(RecieveMessageEvent(data));
      });
    } catch (error) {}
  }

  FutureOr<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    String userId = await _storage.read(key: "userId") ?? "";
    print("userId $userId");
    final newMessage = {
      "conversationId": event.conversationId,
      "content": event.content,
      "senderId": userId,
    };
    _socketService.socket.emit('sendMessage', newMessage);
  }

  FutureOr<void> _onRecieveMessage(
      RecieveMessageEvent event, Emitter<ChatState> emit) async {
    print("step 2 received event Called");
    final message = MessageEntity(
      id: event.message['id'],
      conversationId: event.message['conversation_id'],
      senderId: event.message['sender_id'],
      content: event.message['content'],
      createdAt: event.message['created_at'],
    );
    _messages.add(message);
    emit(ChatLoadedState(List.from(_messages)));
  }
}
