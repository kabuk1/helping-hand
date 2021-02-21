import 'package:flutter/material.dart';
import 'package:helping_hand/services/auth.dart';
import 'package:helping_hand/shared/constansts.dart';
import 'package:helping_hand/screens/home/home.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //final AuthService _auth = AuthService();
  //final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
            backgroundColor: Colors.purple[400],
            elevation: 0.0,
            title: Text('Sign in to Helping Hand'),
            actions: <Widget>[
              FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () {
                    widget.toggleView();
                  })
            ]),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.9),
          child: Form(
            //key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  // validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  // onChanged: (val) {
                  //   setState(() => email = val);
                ),
                // textedFormField
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Password'),
                  // validator: (val) => val.length < 6
                  //     ? 'Enter a password with 6 or more characters.'
                  //     : null,
                  // onChanged: (val) {
                  //   setState(() => password = val);
                ),

                // textedFormField
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    })
                //async {
                //   if (_formKey.currentState.validate()) {
                //     dynamic result = await _auth.signInWithEmailAndPassword(
                //         email, password);
                //     if (result == null) {
                //       setState(() => error =
                //           'Could not sign in with those credentials.');
                //     }
                //   }
                // }),
                // SizedBox(height: 12.0),
                // Text(
                //   error,
                //   style: TextStyle(color: Colors.red, fontSize: 16.0),
                //),
              ],
            ),
          ),
        ));
  }
}
