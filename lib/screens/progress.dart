import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';

final _firestore = Firestore.instance;

class Progress extends StatefulWidget {
  static String id = 'Progress';
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Your BMI Record',
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection(email).snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> querySnapshot) {
                    if (querySnapshot.hasError) {
                      return Center(
                          child: Text(
                        "Error: Data Not Found",
                        style: TextStyle(color: Colors.red),
                      ));
                    }
                    if (!querySnapshot.hasData) {
                      return Center(
                          child: Text(
                        "Error: Data Not Found",
                        style: TextStyle(color: Colors.red),
                      ));
                    }
                    if (querySnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      final list = querySnapshot.data.documents;

                      return ListView.builder(
                        itemBuilder: (context, index) {
                          double bmiForCol = double.parse(list[index]['BMI']);
                          Color col = Color(0xffC80815);
                          if (bmiForCol >= 18.5 && bmiForCol <= 25)
                            col = Colors.green;
                          return Card(
                            color: col,
                            child: ListTile(
                              contentPadding: EdgeInsets.all(10),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'BMI on ' + list[index]['Date'] + ' : ',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  Text(
                                    list[index]['BMI'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: list.length,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
