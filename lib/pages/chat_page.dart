import 'package:chat/core/services/auth/auth_service.dart';

import '../components/messages.dart';
import '../components/new_message.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
    centerTitle: true, 
        title: const Text('Chat Team', textAlign: TextAlign.center,),
        actions: [
          DropdownButton(
            icon: const Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            items: const [
              DropdownMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Sair'),
                  ],
                ),
              ),
            ],
            onChanged: (value) {
              if (value == 'logout') {
                AuthService().logout();
              }
            },
          ),
        ],
      ),
      body: const SafeArea(
        child: Column(children: [Expanded(child: Messages()), NewMessages()]),
      ),
    );
  }
}
