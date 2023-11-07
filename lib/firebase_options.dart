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
    apiKey: 'AIzaSyD1Xw_707bivBYPKLyLU8rr_QgNrTvCM2I',
    appId: '1:180604459920:web:ea6e31b8835949edf6f115',
    messagingSenderId: '180604459920',
    projectId: 'ulearning-app-860f5',
    authDomain: 'ulearning-app-860f5.firebaseapp.com',
    storageBucket: 'ulearning-app-860f5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDuZyUfosvx9pVOT-nOwV9760Enlx5_XIM',
    appId: '1:180604459920:android:71ee2b85598f0ab6f6f115',
    messagingSenderId: '180604459920',
    projectId: 'ulearning-app-860f5',
    storageBucket: 'ulearning-app-860f5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCnFWducKIp29jbx_tFr39ZExY_xgZpsY',
    appId: '1:180604459920:ios:b97a4f912a447077f6f115',
    messagingSenderId: '180604459920',
    projectId: 'ulearning-app-860f5',
    storageBucket: 'ulearning-app-860f5.appspot.com',
    iosBundleId: 'com.example.ulearningApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCnFWducKIp29jbx_tFr39ZExY_xgZpsY',
    appId: '1:180604459920:ios:31d5f8968697221bf6f115',
    messagingSenderId: '180604459920',
    projectId: 'ulearning-app-860f5',
    storageBucket: 'ulearning-app-860f5.appspot.com',
    iosBundleId: 'com.example.ulearningApp.RunnerTests',
  );
}