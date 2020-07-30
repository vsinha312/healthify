import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthify/components/reusable_card.dart';
import 'package:healthify/constants.dart';
import 'package:healthify/screens/final_result.dart';
import 'package:healthify/screens/input_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'input_page.dart';

//class PreFinalScreen extends StatelessWidget {
//  PreFinalScreen({this.bmr, this.weightChange});
//  final double bmr;
//  final double weightChange;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(),
//      body: UserResponse(),
//    );
//  }
//}
double calories;
int activityLevel = 3;
ActivityList newList = ActivityList();
int weeks = 4;

class UserResponse extends StatefulWidget {
  UserResponse({this.bmr, this.weightChange});
  final double bmr;
  final double weightChange;

  @override
  _UserResponseState createState() {
    return _UserResponseState();
  }
}

class _UserResponseState extends State<UserResponse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ReusableCard(
            colour: kDefaultCardColor,
            cardChild: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Set Target Period ( in weeks )',
                    style: kBodyTextStyle.copyWith(
                        color: Colors.blue, fontWeight: FontWeight.w900),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundIconButton(
                      icon: FontAwesomeIcons.angleLeft,
                      action: () {
                        setState(() {
                          if (weeks > 1) weeks--;
                        });
                      },
                    ),
                    Text(
                      '$weeks',
                      style: kBMITextStyle,
                    ),
                    RoundIconButton(
                      icon: FontAwesomeIcons.angleRight,
                      action: () {
                        setState(() {
                          weeks++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Text(
                '# Try to set realistic target. '
                'Don\'t be too hard on yourself',
                style: kBodyTextStyle.copyWith(
                    color: Colors.yellow,
                    fontWeight: FontWeight.w100,
                    fontSize: 18,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          ReusableCard(
            colour: kDefaultCardColor,
            cardChild: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Select your Activity Level',
                    style: kBodyTextStyle.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 50,
                    child: Text(
                      '${newList.statements[activityLevel - 1]}',
                      textAlign: TextAlign.center,
                      style:
                          kBodyTextStyle.copyWith(fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
                SliderTheme(
                  data: SliderThemeData(
                      activeTrackColor: kSelectedGenderColor,
                      thumbColor: kBottomBarColor,
                      overlayColor: Color(0x29ffffff),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0)),
                  child: Slider(
                    value: activityLevel.toDouble(),
                    min: 1,
                    max: 5,
                    inactiveColor: Colors.grey,
                    onChanged: (double newValue) {
                      setState(() {
                        activityLevel = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      calories = bmr * newList.multiplier[activityLevel - 1] +
                          weightChange * 7716 / (weeks * 7);
                      if (calories < 1200)
                        Alert(
                          context: context,
                          style: AlertStyle(backgroundColor: Colors.white),
                          type: AlertType.warning,
                          title: 'Target Period NOT FEASIBLE',
                          desc: "Increase the number of weeks",
                        ).show();
                      else
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FinalResult(
                                      calories: calories,
                                    )));
                    });
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      'FINISH',
                      style: kBodyTextStyle,
                    )),
                    margin: EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ActivityList {
  List<String> statements = [
    'Little or no exercise',
    'Light Exercise/sports 1-3 days per week',
    'Medium Exercise/sports 3-5 days per week',
    'Hard Exercise/sports 6-7 days a week',
    'Intense exercise/sports, physical job or twice-a-day training'
  ];
  List<double> multiplier = [1.2, 1.375, 1.55, 1.725, 1.9];
}
