import 'package:flutter/cupertino.dart';
import 'package:healthify/constants.dart';
import 'package:flutter/material.dart';
import 'package:healthify/components/reusable_card.dart';
import 'package:healthify/screens/pre_final.dart';
import 'input_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import 'package:healthify/screens/progress.dart';
import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd");
final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
String difference;
String gainWeight;
class ResultsPage extends StatelessWidget {
  ResultsPage(
      {this.bmiResult, this.status, this.advice, this.bmr, this.weightChange});
  final String bmiResult;
  final String status;
  final String advice;
  final double bmr;
  final double weightChange;
  String dateString = dateFormat.format(DateTime.now());
  bool unfit() {
    //bool unfit;
    if (status == 'Normal')
      return false;
    else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Center(
//              padding: EdgeInsets.only(top: 20),
//              margin: EdgeInsets.only(left: 20),
              child: Text('Your BMI', style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kDefaultCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    status,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      advice,
                      style: kBodyTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RoundIconButton(
                  action: () {
                    Alert(
                      context: context,
                      style: AlertStyle(backgroundColor: Colors.white),
                      type: AlertType.warning,
                      title: 'Save BMI to record ? ',
                      desc: "Saving False BMI will contaminate your record.",
                      buttons: [
                        DialogButton(
                          color: Colors.green,
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            _firestore.collection(email).add({
                              'BMI': bmiResult,
                              'Date': dateString,
                            });
                            Navigator.pushNamed(context, Progress.id);
                          },
                          width: 120,
                        )
                      ],
                    ).show();
                  },
                  icon: Icons.save,
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (unfit()) {
                      if (weightChange > 0)
                        gainWeight = 'GAIN';
                      else {
                        gainWeight = 'LOSE';
                      }
                      difference = weightChange.abs().toStringAsFixed(1);
                      Alert(
                        context: context,
                        style: AlertStyle(backgroundColor: Colors.white),
                        type: AlertType.info,
                        title: 'You need to $gainWeight $difference kg',
                        desc: "Are you Ready?",
                        buttons: [
                          DialogButton(
                            color: Colors.green,
                            child: Text(
                              "LET's GO !",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return UserResponse(
                                    bmr: bmr,
                                    weightChange: weightChange,
                                  );
                                })),
                            width: 120,
                          )
                        ],
                      ).show();
                    }
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                          'HEALTHIFY ME',
                          style: kBodyTextStyle,
                        )),
                    margin: EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: unfit() ? Colors.blue : Colors.grey),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
