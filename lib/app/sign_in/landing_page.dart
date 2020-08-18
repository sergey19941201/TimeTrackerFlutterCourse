import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/home/jobs/jobs_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/first_sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/services/database.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;
  AuthBase auth;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
//    widget.auth.streamController.stream.listen((user) {
//      print('user from stream: ${user?.uid}');
//    });
  }

  Future<void> _checkCurrentUser() async {
    User user = await auth.currentUser();
    _updateUser(user);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User user = snapshot.data;

            if (user == null) {
              return FirstSignInPage.create(context);
            }

            return Provider<Database>(
                create: (_) => FirestoreDatabase(uid: user.uid),
                child: JobsPage()); // Temp
          } else {
            //return Scaffold(body: Center(child: CircularProgressIndicator()));

            //return  HomePage();
            return FirstSignInPage.create(context);
          }
        });
  }
}
