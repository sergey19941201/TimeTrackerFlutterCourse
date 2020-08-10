import 'dart:async';

import 'package:flutter/foundation.dart';

class User {
  User({@required this.uid});

  final String uid;
}

abstract class AuthBase {
  // ignore: close_sinks
  StreamController<User> streamController;

  Future<User> currentUser();

  Future<User> signInAnonymously();

  Future<void> signOut();
}

class Auth implements AuthBase {
  bool isSignedIn = false;

  @override
  StreamController<User> streamController = StreamController();

  @override
  Future<User> currentUser() async {
    if (isSignedIn) {
      var user = User(uid: 'myUid');
      streamController.add(user);
      return user;
    }

    streamController.add(null);
    return null;
  }

  @override
  Future<User> signInAnonymously() async {
    await Future.delayed(
        const Duration(milliseconds: 10)); // Optional parameter: () {});

    isSignedIn = true;
    var user = User(uid: 'myUid');
    streamController.add(user);
    return user;
  }

  @override
  Future<void> signOut() async {
    isSignedIn = false;
    streamController.add(null);
  }
}
