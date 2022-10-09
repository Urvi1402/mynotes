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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBy_D5dTLFEsODcfTkKQnnM2Gv43vCqXl4',
    appId: '1:989514943077:android:4a141e1c446b842e01948c',
    messagingSenderId: '989514943077',
    projectId: 'mynotes-flutter-project-4ccd1',
    storageBucket: 'mynotes-flutter-project-4ccd1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCO8TT-3Z61ioeD1QJQchoY__Rb8qdBaCs',
    appId: '1:989514943077:ios:86909a70bfd8f42601948c',
    messagingSenderId: '989514943077',
    projectId: 'mynotes-flutter-project-4ccd1',
    storageBucket: 'mynotes-flutter-project-4ccd1.appspot.com',
    iosClientId: '989514943077-tqt35hm6v3s6gh3d8g0m1v9d8rdogo1r.apps.googleusercontent.com',
    iosBundleId: 'com.learningstuff.mynotes',
  );
}