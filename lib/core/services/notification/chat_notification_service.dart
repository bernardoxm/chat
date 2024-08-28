import 'package:chat/core/models/chat_notification.dart';
import 'package:flutter/material.dart';

class ChatNotificationService with ChangeNotifier {
  // ignore: prefer_final_fields
  List<ChatNotification> _items = [];

  // ignore: unused_element
  List<ChatNotification> get _tems {
    return [..._items];
  }

  void add(ChatNotification notification) {
    _items.add(notification);
    notifyListeners();
  }
  void remove(int i ){_items.removeAt(i);}
}
