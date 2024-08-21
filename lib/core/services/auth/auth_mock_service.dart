import 'dart:io';

import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
 static Map<String,ChatUser> _users = {};
static ChatUser? _currentUser;

  @override
  ChatUser? get currentUser {return null;}

  @override
  Future<void> login(String email, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    throw UnimplementedError();
  }

  @override
  Future<void> signup(
      String name, String email, String password, File image) async {
    throw UnimplementedError();
  }

  @override
  Stream<ChatUser?> get userChanges {throw UnimplementedError();}
}
