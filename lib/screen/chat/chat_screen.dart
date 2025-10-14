import 'package:chat_boggy_2025_2/views/chat_view.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my love ❤️'),
        centerTitle: false,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://static.wikia.nocookie.net/disney_details/images/8/85/Hilary_Duff.jpg',
          ),
        ),
      ),
      body: ChatView(),
    );
  }
}
