import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class QuickSportsFirebaseUser {
  QuickSportsFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

QuickSportsFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<QuickSportsFirebaseUser> quickSportsFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<QuickSportsFirebaseUser>(
        (user) => currentUser = QuickSportsFirebaseUser(user));
