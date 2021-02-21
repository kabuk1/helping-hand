import 'package:flutter/material.dart';
import 'package:helping_hand/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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
            title: Text('Sign up to Helping Hand'),
            actions: <Widget>[
              FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
                  onPressed: () {
                    widget.toggleView();
                  })
            ]),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                // textedFormField
                SizedBox(height: 20.0),
                TextFormField(
                    obscureText: true,
                    validator: (val) => val.length < 6
                        ? 'Enter a password with 6 or more characters.'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    }),

                // textedFormField
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(
                              () => error = 'Please supply a valid email.');
                        }
                      }
                    }),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 16.0),
                )
              ],
            ),
          ),
        ));
  }
}
