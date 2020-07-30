import 'package:flutter/material.dart';
import 'package:healthify/screens/input_page.dart';
import 'dart:math';

class CalculateBrain {
  CalculateBrain({this.height, this.weight});
  final int height;
  final int weight;
  double bmi;
  double calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String giveInterpretation() {
    if (bmi >= 25) {
      return 'You need to consume less calories';
    } else if (bmi > 18.5)
      return 'You have a fit body. Keep it up';
    else
      return 'You need to consume more calories';
  }
}
