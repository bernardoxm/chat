import 'dart:io';

import 'package:chat/core/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  static const _defultImage = 'assets/image/avatar.png';
  final ChatMessage message;
  final bool belongsToCurrentUser;
  

  const MessageBubble(
      {super.key, required this.message, required this.belongsToCurrentUser,});

  // ignore: non_constant_identifier_names
  Widget _showUserImage(String ImageUrl) {
    ImageProvider? provider;
    final uri = Uri.parse(ImageUrl);
   

    if (uri.path.contains('assets/image/avatar.png')) {
      provider = const AssetImage(_defultImage);
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toString()));
    }
    return CircleAvatar(
      backgroundColor: Colors.grey,
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: belongsToCurrentUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: belongsToCurrentUser
                      ? const Color.fromARGB(230, 54, 85, 164)                      : Colors.pinkAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: belongsToCurrentUser
                        ? const Radius.circular(12)
                        : const Radius.circular(0),
                    bottomRight: belongsToCurrentUser
                        ? const Radius.circular(0)
                        : const Radius.circular(12),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                width: 180,
                child: Column(
                  crossAxisAlignment: belongsToCurrentUser ? CrossAxisAlignment.end: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.userName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: belongsToCurrentUser
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : Colors.white),
                    ),
                    Text(
                      message.text,
                      textAlign:  belongsToCurrentUser ? TextAlign.right : TextAlign.left,
                      style: TextStyle(
                          color: belongsToCurrentUser
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : Colors.white),
                    ),

                    
                  ],
                )),
                   
                  
                
              
          ],
        ),
        Positioned(
          top: 0,
          left: belongsToCurrentUser ? null : 165,
          right: belongsToCurrentUser ? 165 : null,
          child: CircleAvatar(
            child: _showUserImage(message.userImageURl),
          ),
        ),
      ],
    );
  }
}
