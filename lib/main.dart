import 'package:flutter/material.dart';

import 'modules/archive_task/archive_tasks.dart';
import 'layout/home_layout.dart';
import 'package:sqflite/sqflite.dart';

import 'modules/counter/stateful.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutNav(),
    );
  }
}



