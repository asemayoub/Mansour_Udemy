import 'package:flutter/material.dart';

import 'BMI.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalc(),
    );
  }
}



