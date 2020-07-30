import 'package:flutter/material.dart';
import 'package:healthify/components/reusable_card.dart';
import 'package:healthify/constants.dart';
import 'pre_final.dart';

class FinalResult extends StatelessWidget {
  FinalResult({this.calories});
  final double calories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Here is your path'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ReusableCard(
            colour: kDefaultCardColor,
            cardChild: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You need to eat',
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle.copyWith(fontWeight: FontWeight.w100),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${calories.toStringAsFixed(0)}',
                          textAlign: TextAlign.center,
                          style: kBoldText.copyWith(color: Colors.blue)),
                      Text('  cal',
                          textAlign: TextAlign.center, style: kBodyTextStyle),
                    ],
                  ),
                  Text('per day to achieve your goal in ',
                      textAlign: TextAlign.center,
                      style:
                          kBodyTextStyle.copyWith(fontWeight: FontWeight.w100)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('$weeks',
                          textAlign: TextAlign.center,
                          style: kBoldText.copyWith(color: Colors.blue)),
                      Text(
                        ' weeks',
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              'You may refer to this chart',
              style: kBodyTextStyle.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w100,
                  color: Colors.yellow),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("images/Calorie-Sheet.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
