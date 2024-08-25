import 'dart:async';
import 'dart:math';

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    // ChatMessage(
    //     id: '1',
    //     text: 'Bom dia!',
    //     createAt: DateTime.now(),
    //     userId: '111',
    //     userName: 'Bia',
    //     userImageURl: 'assets/image/avatar.png'),
    //       ChatMessage(
    //     id: '2',
    //     text: 'Bom dia! Teremos reunião hoje?',
    //     createAt: DateTime.now(),
    //     userId: '222',
    //     userName: 'Ana',
    //     userImageURl: 'assets/image/avatar.png'),
    //       ChatMessage(
    //     id: '3',
    //     text: 'Sim!',
    //     createAt: DateTime.now(),
    //     userId: '333',
    //     userName: 'Pedro',
    //     userImageURl: 'assets/image/avatar.png'),
    //       ChatMessage(
    //     id: '4',
    //     text: 'Bom dia!',
    //     createAt: DateTime.now(),
    //     userId: '444',
    //     userName: 'Maria',
    //     userImageURl: 'assets/image/avatar.png'),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURl: user.imageUrl,
    );

    _msgs.add(newMessage);
    _controller?.add(_msgs.reversed.toList());
    return newMessage;
  }
}
