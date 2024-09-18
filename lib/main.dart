import 'dart:io';

import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/pages/auth_or_app_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized(); // Inicializa o Flutter
   await Firebase.initializeApp(
     options: Platform.isIOS
         ? const FirebaseOptions(
             apiKey: 'AIzaSyDAFlFd3K39bBCT4qKA-iqgf2hZkBj4-Wg',
             appId: '1:751149769695:ios:22a67dc2ba0b3bded6da6a',
             messagingSenderId: '751149769695',
             projectId: 'chat-estudos-f6672',
          )
         : const FirebaseOptions(
             apiKey: 'AIzaSyBIZHd4NDwb2T_4klMl6xTHeB076HTmaFA',
             appId: '1:751149769695:android:f897d747a3a49f35d6da6a',
             messagingSenderId: '751149769695',
             projectId: 'chat-estudos-f6672',
          ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatNotificationService(),
        ),
      ],
      child: MaterialApp(
        title: 'Chat team',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
          primarySwatch: Colors.blue,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            color: Colors.pinkAccent,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        home: const AuthOrAppPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
