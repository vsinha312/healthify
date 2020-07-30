import 'package:healthify/components/bmr_calculator.dart';
import 'package:healthify/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthify/components/icon_content.dart';
import 'package:healthify/components/reusable_card.dart';
import 'package:healthify/constants.dart';
import 'results_page.dart';
import 'package:healthify/components/CalculateBrain.dart';

enum Gender {
  male,
  female,
}
double bmr;
double weightChange;
double bmi;

class InputPage extends StatefulWidget {
  static const String id = 'Input_Screen';
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 19;

  double currentBmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kSelectedGenderColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      iconImage: FontAwesomeIcons.male,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kSelectedGenderColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    iconImage: FontAwesomeIcons.female,
                    label: 'FEMALE',
                  ),
                )),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kBoldText,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                            activeTrackColor: kSelectedGenderColor,
                            thumbColor: kBottomBarColor,
                            overlayColor: Color(0x29ffffff),
                            thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15.0)),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          inactiveColor: Colors.grey,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  colour: kDefaultCardColor,
                ),
              ),
            ],
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBoldText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                action: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                action: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    colour: kDefaultCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBoldText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                action: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                action: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                    colour: kDefaultCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              BMRCalculator bmrCalc = BMRCalculator(
                  height: height,
                  age: age,
                  weight: weight,
                  whichGender: selectedGender);
              CalculateBrain calc =
                  CalculateBrain(height: height, weight: weight);
              if (calc.calculateBMI() < 18.5)
                weightChange =
                    weight * (18.5 - calc.calculateBMI()) / calc.calculateBMI();
              else if (calc.calculateBMI() > 25)
                weightChange =
                    weight * (25 - calc.calculateBMI()) / calc.calculateBMI();
              else
                weightChange = 0;

              bmr = bmrCalc.calculate();
              bmi = calc.calculateBMI();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  bmiResult: calc.calculateBMI().toStringAsFixed(1),
                  status: calc.getResult(),
                  advice: calc.giveInterpretation(),
                  bmr: bmr,
                  weightChange: weightChange,
                );
              }));
            },
            button: 'PROCEED',
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.button});
  final Function onTap;
  final String button;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            button,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        color: kBottomBarColor,
        width: double.infinity,
        height: kBottomBarHeight,
        margin: EdgeInsets.only(top: 15.0),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.action});
  final IconData icon;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: action,
      shape: CircleBorder(),
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xff4c4f5e),
      splashColor: kSelectedGenderColor,
    );
  }
}
