import 'package:chat/components/message_bubble.dart';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
   
    final currentUser = AuthService().currentUser;
    // TODO: implement build
    return StreamBuilder<List<ChatMessage>>(
      builder: (cxt, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text('Sem dados. Vamos conversar?'),
          );
        } else {
          final msgs = snapshot.data;
          return ListView.builder(
            reverse: true,
            itemBuilder: (ctx, i) => MessageBubble(
              key: ValueKey(msgs[i].id),
              message: msgs[i],
              belongsToCurrentUser: currentUser?.id == msgs[i].userId,            ),
            itemCount: msgs!.length,
          );
        }
      },
      stream: ChatService().messagesStream(),
    );
  }
}
