import 'package:flutter/material.dart';
import 'package:helping_hand/screens/authenticate/authenticate.dart';
import 'package:helping_hand/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Home or Authenticate widget
    return Authenticate();
  }
}
