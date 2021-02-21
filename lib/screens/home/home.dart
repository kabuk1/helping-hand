import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helping_hand/services/auth.dart';
import 'package:helping_hand/services/database.dart';
import 'package:provider/provider.dart';
import 'package:helping_hand/screens/home/services_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
        value: DatabaseService().services,
        child: Scaffold(
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
          body: ServicesList(),
        ));
  }
}
