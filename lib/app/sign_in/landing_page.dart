import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/first_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/home_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class LandingPage extends StatefulWidget {
  LandingPage({@required this.auth});

  final AuthBase auth;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
//    widget.auth.streamController.stream.listen((user) {
//      print('user from stream: ${user?.uid}');
//    });
  }

  Future<void> _checkCurrentUser() async {
    User user = await widget.auth.currentUser();
    _updateUser(user);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: widget.auth.streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User user = snapshot.data;

            if (user == null) {
              return FirstSignInPage(
                auth: widget.auth,
                onSignIn: _updateUser,
              );
            }

            return HomePage(
                auth: widget.auth, onSignOut: () => _updateUser(null)); // Temp
          } else {
            //return Scaffold(body: Center(child: CircularProgressIndicator()));
            return FirstSignInPage(
              auth: widget.auth,
              onSignIn: _updateUser,
            );
          }
        });
  }
}
