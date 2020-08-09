import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({@required this.auth, @required this.onSignOut});

  final VoidCallback onSignOut;
  final AuthBase auth;

  Future<void> _signOut() async {
    await auth.signOut();
    onSignOut();
    //throw Exception('my exception');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
            child: Text('Logout',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            onPressed: _signOut,
          ),
        ],
      ),
    );
  }
}
