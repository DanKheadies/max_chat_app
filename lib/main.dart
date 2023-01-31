import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:max_chat_app/config/config.dart';
import 'package:max_chat_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Chat App UI',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: const HomeScreen(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/chat',
          page: () => const ChatScreen(),
        ),
      ],
    );
  }
}
