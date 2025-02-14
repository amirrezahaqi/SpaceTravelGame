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
    apiKey: 'AIzaSyA5ZemAPJZ2Mcy6adOu1mvamvW4Zi0-TDo',
    appId: '1:207353984332:web:6ce36239984d8b01410be9',
    messagingSenderId: '207353984332',
    projectId: 'hello-firebase-d45e1',
    authDomain: 'hello-firebase-d45e1.firebaseapp.com',
    storageBucket: 'hello-firebase-d45e1.appspot.com',
    measurementId: 'G-79DSPS50GL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgjFzqoUkU3HjgkUmyDKxHsvxKVPyl4P4',
    appId: '1:207353984332:android:6ae00e6b565d133e410be9',
    messagingSenderId: '207353984332',
    projectId: 'hello-firebase-d45e1',
    storageBucket: 'hello-firebase-d45e1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMY1vkSzDQ4OXBBb-fYgWI_sPUa8fhkoM',
    appId: '1:207353984332:ios:f53fbf485abae164410be9',
    messagingSenderId: '207353984332',
    projectId: 'hello-firebase-d45e1',
    storageBucket: 'hello-firebase-d45e1.appspot.com',
    iosClientId:
        '207353984332-eufidqq1g87a0g29ibfga08rk46k48pj.apps.googleusercontent.com',
    iosBundleId: 'space.travel.game',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMY1vkSzDQ4OXBBb-fYgWI_sPUa8fhkoM',
    appId: '1:207353984332:ios:f53fbf485abae164410be9',
    messagingSenderId: '207353984332',
    projectId: 'hello-firebase-d45e1',
    storageBucket: 'hello-firebase-d45e1.appspot.com',
    iosClientId:
        '207353984332-eufidqq1g87a0g29ibfga08rk46k48pj.apps.googleusercontent.com',
    iosBundleId: 'space.travel.game',
  );
}
