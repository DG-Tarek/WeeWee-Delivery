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
    apiKey: 'AIzaSyACvK5BkJIBwNQGuLpO7xVtoPZRlWlOfjM',
    appId: '1:951871916044:web:2f3de315c6853be39c4629',
    messagingSenderId: '951871916044',
    projectId: 'mhenni-livraison-dz',
    authDomain: 'mhenni-livraison-dz.firebaseapp.com',
    databaseURL: 'https://mhenni-livraison-dz-default-rtdb.firebaseio.com',
    storageBucket: 'mhenni-livraison-dz.appspot.com',
    measurementId: 'G-LZZ3BSYEEK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyArZiVI_kiLCn3ZXOGuikdRBBcTcas6FYE',
    appId: '1:951871916044:android:f592ada8f7671aad9c4629',
    messagingSenderId: '951871916044',
    projectId: 'mhenni-livraison-dz',
    databaseURL: 'https://mhenni-livraison-dz-default-rtdb.firebaseio.com',
    storageBucket: 'mhenni-livraison-dz.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtwwP6NbasraYnGF-Z-954uThJvqhl7Hw',
    appId: '1:951871916044:ios:4f323bee0f093ac69c4629',
    messagingSenderId: '951871916044',
    projectId: 'mhenni-livraison-dz',
    databaseURL: 'https://mhenni-livraison-dz-default-rtdb.firebaseio.com',
    storageBucket: 'mhenni-livraison-dz.appspot.com',
    androidClientId: '951871916044-6iqn7jl5jpaiqrk6iso211nee7kf4n4d.apps.googleusercontent.com',
    iosClientId: '951871916044-1i72e61ftq2c2arn1vc22cogr9tua8pd.apps.googleusercontent.com',
    iosBundleId: 'com.example.weeweeDelivery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtwwP6NbasraYnGF-Z-954uThJvqhl7Hw',
    appId: '1:951871916044:ios:4f323bee0f093ac69c4629',
    messagingSenderId: '951871916044',
    projectId: 'mhenni-livraison-dz',
    databaseURL: 'https://mhenni-livraison-dz-default-rtdb.firebaseio.com',
    storageBucket: 'mhenni-livraison-dz.appspot.com',
    androidClientId: '951871916044-6iqn7jl5jpaiqrk6iso211nee7kf4n4d.apps.googleusercontent.com',
    iosClientId: '951871916044-1i72e61ftq2c2arn1vc22cogr9tua8pd.apps.googleusercontent.com',
    iosBundleId: 'com.example.weeweeDelivery',
  );
}
