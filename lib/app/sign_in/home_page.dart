import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({@required this.onSignOut});

  final VoidCallback onSignOut;

  Future<void> _signOut() {
    // Optional parameter: () {});
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
