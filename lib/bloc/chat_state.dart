part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSucessState extends ChatState {
  final List<ChatMessageModel> messages;

  ChatSucessState({required this.messages});
}
