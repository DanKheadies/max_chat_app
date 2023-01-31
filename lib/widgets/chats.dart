import 'package:flutter/material.dart';

import 'package:max_chat_app/models/models.dart';

class Chats extends StatelessWidget {
  const Chats({
    Key? key,
    required this.chat,
    required this.scrollController,
  }) : super(key: key);

  final Chat chat;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
        reverse: true,
        itemCount: chat.messages.length,
        itemBuilder: ((context, index) {
          Message message = chat.messages[index];
          return Align(
            alignment: (message.senderId == '1')
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.66,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (message.senderId == '1')
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                message.text,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        }),
      ),
    );
  }
}
