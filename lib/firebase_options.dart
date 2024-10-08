// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCz-FSMn41LmfAvrd30N4Dz7rz6KrXhg_s',
    appId: '1:751149769695:web:77e08806b6a0e80ad6da6a',
    messagingSenderId: '751149769695',
    projectId: 'chat-estudos-f6672',
    authDomain: 'chat-estudos-f6672.firebaseapp.com',
    storageBucket: 'chat-estudos-f6672.appspot.com',
    measurementId: 'G-990P43E7ET',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIZHd4NDwb2T_4klMl6xTHeB076HTmaFA',
    appId: '1:751149769695:android:f897d747a3a49f35d6da6a',
    messagingSenderId: '751149769695',
    projectId: 'br.com.chat.team',
    storageBucket: 'br.com.chat.team',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAFlFd3K39bBCT4qKA-iqgf2hZkBj4-Wg',
    appId: '1:751149769695:ios:22a67dc2ba0b3bded6da6a',
    messagingSenderId: '751149769695',
    projectId: 'br.com.ChatTeam',
    storageBucket: 'chat-estudos-f6672.appspot.com',
    iosBundleId: 'br.com.ChatTeam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAFlFd3K39bBCT4qKA-iqgf2hZkBj4-Wg',
    appId: '1:751149769695:ios:dbf028be381da64dd6da6a',
    messagingSenderId: '751149769695',
    projectId: 'chat-estudos-f6672',
    storageBucket: 'chat-estudos-f6672.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCz-FSMn41LmfAvrd30N4Dz7rz6KrXhg_s',
    appId: '1:751149769695:web:60ca7bb0ee04ce20d6da6a',
    messagingSenderId: '751149769695',
    projectId: 'chat-estudos-f6672',
    authDomain: 'chat-estudos-f6672.firebaseapp.com',
    storageBucket: 'chat-estudos-f6672.appspot.com',
    measurementId: 'G-H94V8EQCD6',
  );
}
