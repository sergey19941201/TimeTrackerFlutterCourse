import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/first_sign_in_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _isSignedIn = false;

  void _dummyFirebaseComplete(bool dummyFirebaseComplete) {
    setState(() {
      _isSignedIn = dummyFirebaseComplete;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isSignedIn) {
      return Container(); // Temp
    }

    return FirstSignInPage(
      onSignIn: _dummyFirebaseComplete,
    );
  }
}
