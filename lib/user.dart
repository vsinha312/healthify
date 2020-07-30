import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/login_screen.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class User {
  String date;
  double bmi;

  User({this.date, this.bmi});
}
void getData() {
  _firestore.collection(email).getDocuments().then((querySnapshot) {
    querySnapshot.documents.forEach((result) {
      print(result.data['BMI']);
      print(result.data['Date']);
      //Generate List View from this data.
    });
  });
}