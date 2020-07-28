import 'package:flutter/material.dart';

class RoundBar extends StatelessWidget {

  RoundBar({@required this.colour,@required this.title, @required this.onPressed});
  final Color colour;
  final String title;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}