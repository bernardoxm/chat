import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/pages/auth_or_app_page.dart';
import 'package:chat/pages/auth_page.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider( providers: [ChangeNotifierProvider(create: (_)=> ChatNotificationService(),)],
      child: MaterialApp(
        title: 'Chat Team',
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          primarySwatch: Colors.blue,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 53, 96, 142), titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),),
        ),
        home:  AuthOrAppPage(),
        debugShowCheckedModeBanner:  false,
      ),
    );
  }
}

  