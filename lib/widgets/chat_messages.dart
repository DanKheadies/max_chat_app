import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:max_chat_app/models/models.dart';
import 'package:max_chat_app/widgets/widgets.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    Key? key,
    required this.height,
    required this.chats,
  }) : super(key: key);

  final double height;
  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: height,
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          User user = chats[index].users!.where((user) => user.id != '1').first;
          chats[index]
              .messages
              .sort((a, b) => b.createdAt.compareTo(a.createdAt));
          Message lastMessage = chats[index].messages.first;
          return ListTile(
            onTap: () {
              Get.toNamed(
                '/chat',
                arguments: [
                  user,
                  chats[index],
                ],
              );
            },
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                user.imageUrl,
              ),
            ),
            title: Text(
              '${user.name} ${user.surname}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Text(
              lastMessage.text,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: Text(
              '${lastMessage.createdAt.hour}:${lastMessage.createdAt.minute}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        },
      ),
    );
  }
}
