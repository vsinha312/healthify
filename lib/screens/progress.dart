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
          title: Text('Your BMI Record'),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection(email).snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot){
                    if(querySnapshot.hasError)
                      {
                        return Text("Error, Data Not Found");
                      }
                    if(!querySnapshot.hasData)
                      {
                        return Text("Error, Data Not Found");
                      }
                    if(querySnapshot.connectionState==ConnectionState.waiting)
                      {
                        return CircularProgressIndicator();
                      }
                    else{
                      final list = querySnapshot.data.documents;
                    return ListView.builder(
                        itemBuilder: (context, index){
                      return ListTile(
                        title: Text('BMI: '+ list[index]['BMI']),
                        subtitle: Text('Date Recorded: ' + list[index]['Date']),
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
    ),);
  }
}

