import 'package:flutter/material.dart';
//Implement Home Screen Here.
class HomeScreen extends StatefulWidget {
  static const String id = 'Home_Screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
