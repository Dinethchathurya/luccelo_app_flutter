// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDzpN4LAnyE9KN7FUlT5IIlI-4rUNiKbY8',
    appId: '1:892381183823:web:b37b7a5985b6def80a8f3a',
    messagingSenderId: '892381183823',
    projectId: 'luccelo-7be9f',
    authDomain: 'luccelo-7be9f.firebaseapp.com',
    storageBucket: 'luccelo-7be9f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGN6sC2ucwb_38GciB9yGo7rK8atCOfu8',
    appId: '1:892381183823:android:53d2cabdaf0172700a8f3a',
    messagingSenderId: '892381183823',
    projectId: 'luccelo-7be9f',
    storageBucket: 'luccelo-7be9f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhaq7neJgKsWMT_Np0dTIdvJfUZer61FY',
    appId: '1:892381183823:ios:184171f48e1388a70a8f3a',
    messagingSenderId: '892381183823',
    projectId: 'luccelo-7be9f',
    storageBucket: 'luccelo-7be9f.appspot.com',
    iosBundleId: 'com.example.lucceloApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhaq7neJgKsWMT_Np0dTIdvJfUZer61FY',
    appId: '1:892381183823:ios:d848e36c2fd6d5410a8f3a',
    messagingSenderId: '892381183823',
    projectId: 'luccelo-7be9f',
    storageBucket: 'luccelo-7be9f.appspot.com',
    iosBundleId: 'com.example.lucceloApp.RunnerTests',
  );
}
