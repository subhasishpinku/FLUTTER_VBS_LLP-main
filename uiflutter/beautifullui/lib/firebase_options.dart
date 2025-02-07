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
    apiKey: 'AIzaSyDx4d_WCUcM6M7-1vlfMcekpIrHK51wD2o',
    appId: '1:73357122110:web:c8d4f88393f57bdec4cf6f',
    messagingSenderId: '73357122110',
    projectId: 'flutterbloc-39468',
    authDomain: 'flutterbloc-39468.firebaseapp.com',
    storageBucket: 'flutterbloc-39468.appspot.com',
    measurementId: 'G-D6X509R1FT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCf-qb4vhi272EgURja435MCJvOP15yGYk',
    appId: '1:73357122110:android:35653d206223ea7cc4cf6f',
    messagingSenderId: '73357122110',
    projectId: 'flutterbloc-39468',
    storageBucket: 'flutterbloc-39468.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqtTmjTTIkw0ql6SLskcG_jx1mrUo83Yo',
    appId: '1:73357122110:ios:505621d80d951a2cc4cf6f',
    messagingSenderId: '73357122110',
    projectId: 'flutterbloc-39468',
    storageBucket: 'flutterbloc-39468.appspot.com',
    iosBundleId: 'com.example.beautifullui',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqtTmjTTIkw0ql6SLskcG_jx1mrUo83Yo',
    appId: '1:73357122110:ios:505621d80d951a2cc4cf6f',
    messagingSenderId: '73357122110',
    projectId: 'flutterbloc-39468',
    storageBucket: 'flutterbloc-39468.appspot.com',
    iosBundleId: 'com.example.beautifullui',
  );
}
