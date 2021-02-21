//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/services/auth.dart';
import 'package:helping_hand/screens/find_helper.dart';
//import 'package:helping_hand/services/database.dart';
//import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('Helping Hand'),
        backgroundColor: Colors.green[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Center(
        // child: RaisedButton(
        //   elevation: 0,
        //   padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        //   color: Colors.green[400],
        //   textColor: Colors.white,
        //   child: Text(
        //     'I would like to help',
        //     style: TextStyle(
        //         fontSize: 32.0,
        //         fontWeight: FontWeight.bold,
        //         fontStyle: FontStyle.italic,
        //         textBaseline: TextBaseline.alphabetic),
        //   ),
        //   onPressed: () {
        //     //  Navigate to a list of those in need
        //   },
        child: RaisedButton(
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          color: Colors.green[400],
          textColor: Colors.white,
          child: Text(
            'I need assistance.',
            style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                textBaseline: TextBaseline.alphabetic),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FindHelper()),
            );
          },
        ),
      ),
    );
  }
}
