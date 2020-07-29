import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import 'package:healthify/components/roundBar.dart';
//Implement Home Screen Here.
FirebaseUser loggedInUser;
class HomeScreen extends StatefulWidget {
  static const String id = 'Home_Screen';
  final Function logout;
  HomeScreen(this.logout);
  @override
  _HomeScreenState createState() => _HomeScreenState(logout);
}

class _HomeScreenState extends State<HomeScreen> {

  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }}
    final Function logout;
  _HomeScreenState(this.logout);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    profilePic
                  ),
                  radius: 30.0,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Hi $name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 80.0,
                      ),
                      ClickBar(
                        title: 'Calculate BMI',
                        colour: Colors.teal,
                        onPressed: () {
                          //TODO:Add BMI navigator here.
                        }
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ClickBar(
                        title: 'View Previous Results',
                        colour: Colors.teal,
                        onPressed: (){
                          //TODO:Add the screen to navigate to see the previous results here.
                        },
                      )
                    ],
                  ),
                  Container(
                    child: ClickBar(
                      title: 'Sign Out',
                      colour: Colors.teal[400],
                      onPressed: (){
                        _auth.signOut();
                        logout();
                        Navigator.pop(context);
                      },
                    )
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
