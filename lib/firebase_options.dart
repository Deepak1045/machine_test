import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqcSksTcSqAdrINblOQXrY2LIa2GapgWs',
    appId: '1:517781256653:android:8fd2920df741f574cc6c84',
    messagingSenderId: '517781256653',
    projectId: 'fir-series-7b26f',
    storageBucket: 'fir-series-7b26f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZ1UYrU8LrYHNqWqpmnH9NehrTPCLzbdQ',
    appId: '1:1093337698696:ios:93ed07b8e382aad6d6aa3d',
    messagingSenderId: '1093337698696',
    projectId: 'ohoemarket',
    storageBucket: 'ohoemarket.firebasestorage.app',
    iosBundleId: 'com.example.ohoemarket',
  );
}
