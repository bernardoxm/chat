import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  String _Message = '';

  final _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;
    if (user != null) {
      await ChatService().save(_Message, user);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
            child: TextField(
          onChanged: (msg) => setState(() => _Message = msg),
          controller: _messageController,
          decoration: const InputDecoration(labelText: 'Enviar Mesagem...'),
          onSubmitted: (_) {if(_Message.trim().isNotEmpty){_sendMessage();}},
        )),
        IconButton(
            onPressed: _Message.trim().isEmpty ? null : _sendMessage,
            icon: Icon(Icons.send))
      ],
    );
  }
}
