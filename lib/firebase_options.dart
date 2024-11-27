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
    apiKey: 'AIzaSyCWeiX2GnGzLFPDPPVOmVMAmBhgkYHTkGo',
    appId: '1:588240235676:web:80b99c58e74e457fc25159',
    messagingSenderId: '588240235676',
    projectId: 'newstore-60688',
    authDomain: 'newstore-60688.firebaseapp.com',
    storageBucket: 'newstore-60688.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSR4dSsVAenWCxnPB1JO4xttkGGB8ND10',
    appId: '1:588240235676:android:7e0b3a0db994a7cdc25159',
    messagingSenderId: '588240235676',
    projectId: 'newstore-60688',
    storageBucket: 'newstore-60688.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcgIqxdl4sw2hDkZuyP4WmxaQV53gN_zk',
    appId: '1:588240235676:ios:8cb46cc08c3ccea8c25159',
    messagingSenderId: '588240235676',
    projectId: 'newstore-60688',
    storageBucket: 'newstore-60688.appspot.com',
    iosBundleId: 'com.example.flutterWithFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcgIqxdl4sw2hDkZuyP4WmxaQV53gN_zk',
    appId: '1:588240235676:ios:8cb46cc08c3ccea8c25159',
    messagingSenderId: '588240235676',
    projectId: 'newstore-60688',
    storageBucket: 'newstore-60688.appspot.com',
    iosBundleId: 'com.example.flutterWithFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCWeiX2GnGzLFPDPPVOmVMAmBhgkYHTkGo',
    appId: '1:588240235676:web:e25f2c22f42c923cc25159',
    messagingSenderId: '588240235676',
    projectId: 'newstore-60688',
    authDomain: 'newstore-60688.firebaseapp.com',
    storageBucket: 'newstore-60688.appspot.com',
  );

}