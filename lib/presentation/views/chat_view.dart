import 'package:chat_boggy_2025_2/domain/entities/message.dart';
import 'package:chat_boggy_2025_2/presentation/views/her_message_bubble_view.dart';
import 'package:chat_boggy_2025_2/presentation/views/my_message_bubble_view.dart';
import 'package:chat_boggy_2025_2/presentation/widgets/message_field_box.dart';
import 'package:chat_boggy_2025_2/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final ChatProvider chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  return chatProvider.messagesList[index].fromWho ==
                          FromWho.hers
                      ? HerMessageBubbleView(
                          colorScheme: colorScheme,
                          urlImageBubble:
                              chatProvider.messagesList[index].imageUrl!,
                        )
                      : MyMessageBubbleView(
                          colorScheme: colorScheme,
                          message: chatProvider.messagesList[index].text,
                        );
                },
              ),
            ),
          ),
          MessageFieldBox(onSend: (value) => chatProvider.sendMessage(value)),
        ],
      ),
    );
  }
}
