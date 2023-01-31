import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:max_chat_app/models/models.dart';
import 'package:max_chat_app/widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  late Chat chat;
  late String text;
  late User user;

  @override
  void initState() {
    super.initState();
    user = Get.arguments[0];
    chat = Get.arguments[1];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<User> users = User.users;
    List<Chat> chats = Chat.chats;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      child: Scaffold(
        appBar: ChatAppBar(
          user: user,
        ),
        body: CustomContainer(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Chats(
                chat: chat,
                scrollController: scrollController,
              ),
              TextFormField(
                controller: textEditingController,
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      Theme.of(context).colorScheme.secondary.withAlpha(150),
                  hintText: 'Type here ...',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(20),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Message message = Message(
                        senderId: '1',
                        recipientId: user.id,
                        text: text,
                        createdAt: DateTime.now(),
                      );
                      List<Message> messages = List.from(chat.messages)
                        ..add(message);
                      messages
                          .sort((a, b) => b.createdAt.compareTo(a.createdAt));
                      setState(() {
                        chat = chat.copyWith(messages: messages);
                      });
                      scrollController.animateTo(
                        scrollController.position.minScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      textEditingController.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
