import 'package:flutter/material.dart';
import 'package:helping_hand/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        elevation: 0.0,
        title: Text('Sign in to Happy Hands'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: RaisedButton(
              child: Text('Sign In'),
              onPressed: () async {
                dynamic result = await _auth.signIn();
              })),
    );
  }
}
