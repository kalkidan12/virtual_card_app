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
    apiKey: 'AIzaSyCYjzQ8h2IQjVROzTDZu-WEUa-90hpCn1Y',
    appId: '1:565970376755:web:c552fc3a75de9a30c2ab46',
    messagingSenderId: '565970376755',
    projectId: 'kalycard-8bbc8',
    authDomain: 'kalycard-8bbc8.firebaseapp.com',
    storageBucket: 'kalycard-8bbc8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEv0Q8WpCc8q2vkT5d6b3bLQhgf0MfB6w',
    appId: '1:565970376755:android:b0dd3236c8fa27f3c2ab46',
    messagingSenderId: '565970376755',
    projectId: 'kalycard-8bbc8',
    storageBucket: 'kalycard-8bbc8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAh70p6juLQQ5OZ8sFHPB_oI5Hoy9DBgTM',
    appId: '1:565970376755:ios:0ebe5cb233d1636cc2ab46',
    messagingSenderId: '565970376755',
    projectId: 'kalycard-8bbc8',
    storageBucket: 'kalycard-8bbc8.appspot.com',
    iosClientId: '565970376755-i92m083bdkbr37di6cvjqgduvs7gbh82.apps.googleusercontent.com',
    iosBundleId: 'com.kaliget.investmentmanager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAh70p6juLQQ5OZ8sFHPB_oI5Hoy9DBgTM',
    appId: '1:565970376755:ios:0ebe5cb233d1636cc2ab46',
    messagingSenderId: '565970376755',
    projectId: 'kalycard-8bbc8',
    storageBucket: 'kalycard-8bbc8.appspot.com',
    iosClientId: '565970376755-i92m083bdkbr37di6cvjqgduvs7gbh82.apps.googleusercontent.com',
    iosBundleId: 'com.kaliget.investmentmanager',
  );
}
