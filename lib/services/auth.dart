import 'package:flutter/foundation.dart';

class User {
  User({@required this.uid});

  final String uid;
}

abstract class AuthBase {
  Future<User> currentUser();

  Future<User> signInAnonymously();

  Future<void> signOut();
}

class Auth implements AuthBase {
  bool isSignedIn = true;

  @override
  Future<User> currentUser() async {
    if (isSignedIn) {
      return User(uid: 'myUid');
    }
    return null;
  }

  @override
  Future<User> signInAnonymously() async {
    await Future.delayed(
        const Duration(milliseconds: 10)); // Optional parameter: () {});

    isSignedIn = true;
    return User(uid: 'myUid');
  }

  @override
  Future<void> signOut() async {
    isSignedIn = false;
  }
}
