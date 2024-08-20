import 'dart:io';

import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  @override
  // TODO: implement currentUser
  ChatUser? get currentUser => throw UnimplementedError();

  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signup(String name, String email, String password, File image) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  // TODO: implement userChanges
  Stream<ChatUser?> get userChanges => throw UnimplementedError();
}