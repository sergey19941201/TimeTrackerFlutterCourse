import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/first_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/home_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _isSignedIn;

  @override
  void initState(){
    super.initState();
    _isSignedIn = true;
  }

  void _updateUser(bool dummyFirebaseComplete) {
    setState(() {
      _isSignedIn = dummyFirebaseComplete;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isSignedIn) {
      return HomePage(onSignOut: () => _updateUser(false)); // Temp
    }

    return FirstSignInPage(
      onSignIn: _updateUser,
    );
  }
}
