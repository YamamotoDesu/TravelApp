import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBvDNsldf4Ru0elWsS2fQEdw2BsH7AJAGw",
            authDomain: "flutterflowstarter.firebaseapp.com",
            projectId: "flutterflowstarter",
            storageBucket: "flutterflowstarter.appspot.com",
            messagingSenderId: "851397253901",
            appId: "1:851397253901:web:1fa0bd9d4d6a214d30ae44"));
  } else {
    await Firebase.initializeApp();
  }
}
