import 'package:flutter/material.dart';
import 'package:healthify/constants.dart';
import 'package:healthify/components/roundBar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthify/screens/home_screen.dart';

String name;
String profilePic;

class LoginScreen extends StatefulWidget {
  static const String id = 'Login_Screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isSignIn = false;

  Future<void> handleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final AuthResult result = (await _auth.signInWithCredential(credential));

    final _user = result.user;

    assert(_user.displayName != null);
    assert(_user.photoUrl != null);
    assert(_user.email != null);

    name = _user.displayName;
    profilePic = _user.photoUrl;
    setState(() {
      isSignIn = true;
    });

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }
  }

  Future<void> googleSignOut() async {
    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();
      setState(() {
        isSignIn = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
//      backgroundColor: Color(0xFF175873),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundBar(
//              colour: Colors.teal,
              colour: Colors.white,
              textColor: Colors.black,
              title: 'Sign In With Google',
              picture: Image(
                  image: AssetImage("images/google_logo.png"), height: 35.0),
              onPressed: () async {
                await handleSignIn();
                try {
                  if (isSignIn == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(googleSignOut)));
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
