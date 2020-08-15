import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class User {
  User({@required this.uid});

  final String uid;
}

abstract class AuthBase {
  // ignore: close_sinks
  StreamController<User> streamController;

  Future<User> currentUser();

  Future<User> signInAnonymously();

  Future<User> signInWithEmailAndPassword(String email, String password);

  Future<User> createUserWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}

class Auth implements AuthBase {
  bool isSignedIn = true;

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
        const Duration(seconds: 1)); // Optional parameter: () {});

    isSignedIn = true;
    var user = User(uid: 'myUid');
    streamController.add(user);
    return user;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    isSignedIn = true;
    // Red input error highlights will work if exception thrown
    throw PlatformException(
        code: 'CUSTOM_PLATFORM_EXCEPTION', message: 'User does not exist');
    await Future.delayed(const Duration(milliseconds: 2000));
    return User(uid: "myUid");
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    isSignedIn = true;
    // Red input error highlights will work if exception thrown
    throw PlatformException(
        code: 'CUSTOM_PLATFORM_EXCEPTION', message: 'User does not exist');
    await Future.delayed(const Duration(milliseconds: 2000));
    return User(uid: "myUid");
  }

  @override
  Future<void> signOut() async {
    isSignedIn = false;
    streamController.add(null);
  }
}
