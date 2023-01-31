import 'package:flutter/material.dart';

import 'package:max_chat_app/models/models.dart';

class ChatAppBar extends StatelessWidget with PreferredSizeWidget {
  final User user;

  const ChatAppBar({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            '${user.name} ${user.surname}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'Online',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              user.imageUrl,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
