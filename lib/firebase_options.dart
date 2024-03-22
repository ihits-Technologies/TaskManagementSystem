// // File generated by FlutterFire CLI.
// // ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;
//
// /// Default [FirebaseOptions] for use with your Firebase apps.
// ///
// /// Example:
// /// ```dart
// /// import 'firebase_options.dart';
// /// // ...
// /// await Firebase.initializeApp(
// ///   options: DefaultFirebaseOptions.currentPlatform,
// /// );
// /// ```
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     if (kIsWeb) {
//       return web;
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       case TargetPlatform.macOS:
//         return macos;
//       case TargetPlatform.windows:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for windows - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       case TargetPlatform.linux:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions have not been configured for linux - '
//           'you can reconfigure this by running the FlutterFire CLI again.',
//         );
//       default:
//         throw UnsupportedError(
//           'DefaultFirebaseOptions are not supported for this platform.',
//         );
//     }
//   }
//
//   static const FirebaseOptions web = FirebaseOptions(
//     apiKey: 'AIzaSyAXF0q_lE69BU6R3mZtiUsd34Dz5Ba8h2o',
//     appId: '1:283043512125:web:a2e88993421bd7e36dcf54',
//     messagingSenderId: '283043512125',
//     projectId: 'myapp-bdbb2',
//     authDomain: 'myapp-bdbb2.firebaseapp.com',
//     storageBucket: 'myapp-bdbb2.appspot.com',
//     measurementId: 'G-CLV8YLJ527',
//   );
//
//   static const FirebaseOptions android = FirebaseOptions(
//     apiKey: 'AIzaSyDEX6AW4doUB-i8Czz7U5lAj1TbSHym0go',
//     appId: '1:283043512125:android:b238fc0cdfc8921e6dcf54',
//     messagingSenderId: '283043512125',
//     projectId: 'myapp-bdbb2',
//     storageBucket: 'myapp-bdbb2.appspot.com',
//   );
//
//   static  FirebaseOptions ios = FirebaseOptions(
//     apiKey: 'AIzaSyBQQXSWcaMAp6fmTzj_OPbWUwOdw1_ekCQ',
//     appId: '1:283043512125:ios:b9ae2922cdc78e296dcf54',
//     messagingSenderId: '283043512125',
//     projectId: 'myapp-bdbb2',
//     storageBucket: 'myapp-bdbb2.appspot.com',
//     iosBundleId: 'com.example.tms',
//   );
//
//   static  FirebaseOptions macos = FirebaseOptions(
//     apiKey: 'AIzaSyBQQXSWcaMAp6fmTzj_OPbWUwOdw1_ekCQ',
//     appId: '1:283043512125:ios:fc4891d153f993426dcf54',
//     messagingSenderId: '283043512125',
//     projectId: 'myapp-bdbb2',
//     storageBucket: 'myapp-bdbb2.appspot.com',
//     iosBundleId: 'com.example.tms.RunnerTests',
//   );
// }
