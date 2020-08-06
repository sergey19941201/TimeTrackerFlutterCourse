import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

class FirstSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 10.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          CustomRaisedButton(
            child: Text(
              'Sign in with Google',
              style: TextStyle(color: Colors.black87, fontSize: 15),
            ),
            color: Colors.white,
            borderRadius: 4.0,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
