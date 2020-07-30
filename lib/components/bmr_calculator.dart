import 'package:flutter/material.dart';
import 'package:healthify/screens/input_page.dart';

class BMRCalculator {
  BMRCalculator(
      {@required this.whichGender,
      @required this.height,
      @required this.age,
      @required this.weight});
  final Gender whichGender;
  final int weight;
  final int height;
  final int age;

  double calculate() {
    double bmr;
    whichGender == Gender.male
        ? bmr = (66 + weight * 13.84 + 5 * height - 6.8 * age)
        : bmr = (655 + weight * 9.67 + 1.85 * height - 4.7 * age);

    return bmr;
  }
}
