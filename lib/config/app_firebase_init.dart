// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';
//
// Future<void> initFireBase() async {
//   await Firebase.initializeApp();
//   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
//   PlatformDispatcher.instance.onError = (error, stack) {
//     FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//     return true;
//   };
// }

// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }
//
//   static const FirebaseOptions android = FirebaseOptions(
//     apiKey: 'AIzaSyDrHeH0oBnG__3IjK2d3HW-dsCHHs5ZXVs',
//     appId: '',
//     messagingSenderId: '',
//     projectId: 'rapicredito-36559',
//     storageBucket: 'rapicredito-36559.appspot.com',
//   );
// }
