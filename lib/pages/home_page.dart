import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_bot/bloc/chat_bloc.dart';
import 'package:space_bot/models/chat_message_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatBloc chatBloc = ChatBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (ChatSucessState):
              List<ChatMessageModel> messages =
                  (state as ChatSucessState).messages;

              return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/space_pg.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Space Bot",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.image_search_rounded))
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.amber.withOpacity(0.1),
                            ),
                            child: Text(messages[index].parts.first.text));
                      },
                    )),
                    Container(
                      height: 120,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 30),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                                  controller: textEditingController,
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ))),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                String text = textEditingController.text;
                                textEditingController.clear();
                                chatBloc.add(ChatGenerateNewTextMessageEvent(
                                    inputMessage: text));
                              }
                            },
                            child: CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
