import 'dart:async';

import 'package:chatapp/features/conversation/presentation/bloc/conversation_event.dart';
import 'package:chatapp/features/conversation/presentation/bloc/conversation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/fetch_conversation_use_case.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final FetchConversationUseCase fetchConversationUseCase;

  ConversationBloc({required this.fetchConversationUseCase})
      : super(ConversationInitial()) {
    on<FetchConversations>(_onFetchConversations);
  }

  FutureOr<void> _onFetchConversations(
      FetchConversations event, Emitter<ConversationState> emit) async {
    emit(ConversationLoading());
    try {
      final conversation = await fetchConversationUseCase();
    } catch (e) {
      emit(ConversationError('Failed to load conversations'));
    }
  }
}
