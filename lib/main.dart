//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:healthify/screens/home_screen.dart';
import 'package:healthify/screens/input_page.dart';
import 'package:healthify/screens/login_screen.dart';
import 'package:healthify/screens/input_page.dart';
import 'package:healthify/screens/pre_final.dart';
import 'package:healthify/screens/results_page.dart';

import 'screens/login_screen.dart';

void main() => runApp(Healthify());

class Healthify extends StatelessWidget {
  void nothing() {
    print('This Function does nothing');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(nothing),
        InputPage.id: (context) => InputPage(),
//        ResultsPage.id: (context)=> ResultsPage();
      },
    );
  }
}
