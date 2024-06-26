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
    apiKey: 'AIzaSyDkk-1rAK2KHKe1pzyhKM-c3elAueo7iMo',
    appId: '1:484708071077:web:0890e2748136f0f818bf4c',
    messagingSenderId: '484708071077',
    projectId: 'aplicatie-polihack',
    authDomain: 'aplicatie-polihack.firebaseapp.com',
    storageBucket: 'aplicatie-polihack.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQtl_9DKM6ABN9P7JW6IQx2UYq0ellijs',
    appId: '1:484708071077:android:363405e2852dfa9118bf4c',
    messagingSenderId: '484708071077',
    projectId: 'aplicatie-polihack',
    storageBucket: 'aplicatie-polihack.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-eL0XRtyUOFxicOQD0lqlHfw2PYlUewo',
    appId: '1:484708071077:ios:cb6123136d7a3b7918bf4c',
    messagingSenderId: '484708071077',
    projectId: 'aplicatie-polihack',
    storageBucket: 'aplicatie-polihack.appspot.com',
    iosBundleId: 'com.example.aplicatiePolihackV15',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-eL0XRtyUOFxicOQD0lqlHfw2PYlUewo',
    appId: '1:484708071077:ios:cb6123136d7a3b7918bf4c',
    messagingSenderId: '484708071077',
    projectId: 'aplicatie-polihack',
    storageBucket: 'aplicatie-polihack.appspot.com',
    iosBundleId: 'com.example.aplicatiePolihackV15',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDkk-1rAK2KHKe1pzyhKM-c3elAueo7iMo',
    appId: '1:484708071077:web:4e200aaa63d1a2ff18bf4c',
    messagingSenderId: '484708071077',
    projectId: 'aplicatie-polihack',
    authDomain: 'aplicatie-polihack.firebaseapp.com',
    storageBucket: 'aplicatie-polihack.appspot.com',
  );
}
