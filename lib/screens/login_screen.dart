import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';
import 'package:healthify/components/roundBar.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'Login_Screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFF175873),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundBar(
              title:'Google Sign In',
              colour: Colors.teal,
              onPressed: () {
                print('Logged In');
              },
            ),
          ],
        ),
      ),
    );
  }
}
