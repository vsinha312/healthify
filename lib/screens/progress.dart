import 'package:flutter/material.dart';
import 'package:healthify/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';
import 'package:healthify/user.dart';

final _firestore = Firestore.instance;
class Progress extends StatefulWidget {
  static String id = 'Progress';
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  //List<User> data = List<User>();

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your BMI Record'),
        ),
        body: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
              ],
            )
        ),
      ),
    );
  }
}
