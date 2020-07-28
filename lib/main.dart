import 'package:flutter/material.dart';
import 'package:healthify/screens/home_screen.dart';
import 'package:healthify/screens/login_screen.dart';

void main() => runApp(Healthify());

class Healthify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    routes: {
    HomeScreen.id : (context) => HomeScreen(),},
    );
  }
}
