import 'package:flutter/material.dart';

import 'package:max_chat_app/models/models.dart';
import 'package:max_chat_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            ChatContacts(
              height: height,
              users: users,
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ChatMessages(
                    height: height,
                    chats: chats,
                  ),
                  CustomBottomNavBar(
                    width: width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
