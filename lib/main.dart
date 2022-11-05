import 'package:flutter/material.dart';

import 'modules/BMI.dart';
import 'modules/loginscreen.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: LoginScreen(),
    );
  }
}



