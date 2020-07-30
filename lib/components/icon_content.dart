import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.iconImage, this.label});
  final IconData iconImage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconImage,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: kLabelTextStyle.copyWith(color: Colors.white),
        )
      ],
    );
  }
}
