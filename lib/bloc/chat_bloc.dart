import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:space_bot/models/chat_message_model.dart';
import 'package:space_bot/repos/chat_repo.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSucessState(messages: [])) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }
  List<ChatMessageModel> messages = [];

  FutureOr<void> chatGenerateNewTextMessageEvent(
      ChatGenerateNewTextMessageEvent event, Emitter<ChatState> emit) async {
    messages.add(ChatMessageModel(
        role: "user", parts: [ChatPartModel(text: event.inputMessage)]));
    emit(ChatSucessState(messages: messages));
    String generatedText = await ChatRepo.chatTextGenerationRepo(messages);

    if (generatedText.isNotEmpty) {
      messages.add(ChatMessageModel(
          role: 'model', parts: [ChatPartModel(text: generatedText)]));
      emit(ChatSucessState(messages: messages));
    }
  }
}
