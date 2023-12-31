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
    apiKey: 'AIzaSyCPXhBidf5NVEH775xR9oa1BtT-G_96Qq4',
    appId: '1:363809960499:web:da82b3bf7411452393a946',
    messagingSenderId: '363809960499',
    projectId: 'logindemo-c2b84',
    authDomain: 'logindemo-c2b84.firebaseapp.com',
    storageBucket: 'logindemo-c2b84.appspot.com',
    measurementId: 'G-X1HV5R2DFE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBO0EyVvcpvT1qEkG0veHHiMdB44XeF7zM',
    appId: '1:363809960499:android:7970cc4c6c37b97a93a946',
    messagingSenderId: '363809960499',
    projectId: 'logindemo-c2b84',
    storageBucket: 'logindemo-c2b84.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAB747A7vHMGgjA8kJ9tRxhg7STA_Z461Y',
    appId: '1:363809960499:ios:f25a021522f5250293a946',
    messagingSenderId: '363809960499',
    projectId: 'logindemo-c2b84',
    storageBucket: 'logindemo-c2b84.appspot.com',
    iosBundleId: 'com.example.thirdPartySignIn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAB747A7vHMGgjA8kJ9tRxhg7STA_Z461Y',
    appId: '1:363809960499:ios:883f2385b3493cfb93a946',
    messagingSenderId: '363809960499',
    projectId: 'logindemo-c2b84',
    storageBucket: 'logindemo-c2b84.appspot.com',
    iosBundleId: 'com.example.thirdPartySignIn.RunnerTests',
  );
}
