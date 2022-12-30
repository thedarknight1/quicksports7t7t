import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBo0_19J2azpByvyhEokEmvu3oAt5qRVfo",
            authDomain: "quicksports-d8457.firebaseapp.com",
            projectId: "quicksports-d8457",
            storageBucket: "quicksports-d8457.appspot.com",
            messagingSenderId: "308180429807",
            appId: "1:308180429807:web:10d7220957f8ee4648e41a",
            measurementId: "G-6W5LKQYRPS"));
  } else {
    await Firebase.initializeApp();
  }
}
