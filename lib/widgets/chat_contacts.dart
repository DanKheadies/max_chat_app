import 'package:flutter/material.dart';

import 'package:max_chat_app/models/models.dart';

class ChatContacts extends StatelessWidget {
  const ChatContacts({
    Key? key,
    required this.height,
    required this.users,
  }) : super(key: key);

  final double height;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.125,
      margin: const EdgeInsets.only(
        left: 20,
        top: 20,
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (context, index) {
            User user = users[index];
            return Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      user.imageUrl,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
