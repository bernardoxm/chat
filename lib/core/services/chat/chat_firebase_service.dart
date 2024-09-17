import 'dart:async';
import 'dart:math';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirebaseService implements ChatService {
  @override
  Stream<List<ChatMessage>> messagesStream() {
    final store = FirebaseFirestore.instance;
    final snapshots = store
        .collection('chat')
        .withConverter(fromFirestore: _fromFirestore, toFirestore: _toFirestore)
        .orderBy('createdAt', descending: true)
        .snapshots();

    return Stream<List<ChatMessage>>.multi((controller) {
      snapshots.listen((snapshots) {
       List<ChatMessage> lista = snapshots.docs.map((doc) {
       return doc.data();
       }).toList();
       controller.add(lista);
      });
    });
  }

  @override
  Future<ChatMessage?> save(String text, ChatUser user) async {
    final store = FirebaseFirestore.instance;
    final msg = ChatMessage(
        id: '',
        text: text,
        createdAt: DateTime.now(),
        userId: user.id,
        userName: user.name,
        userImageURl: user.imageUrl);

    final docRef = await store
        .collection('chat')
        .withConverter(
          fromFirestore: _fromFirestore,
          toFirestore: _toFirestore,
        )
        .add(msg);

    final doc = await docRef.get();
    return doc.data()!;
  }

  Map<String, dynamic> _toFirestore(
    ChatMessage msg,
    SetOptions? options,
  ) {
    return {
      'text': msg.text,
      'createdAt': msg.createdAt.toIso8601String(),
      'userId': msg.userId,
      'userName': msg.userName,
      'userImageURl': msg.userImageURl,
    };
  }

  ChatMessage _fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    return ChatMessage(
        id: doc.id,
        text: doc['text'],
        createdAt: DateTime.parse(doc['createdAt']),
        userId: doc['userId'],
        userName: doc['userName'],
        userImageURl: doc['userImageURl']);
  }
}

  

