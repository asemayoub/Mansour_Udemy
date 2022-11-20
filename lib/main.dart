import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:newtharwat/shared/bloc_observe.dart';

import 'modules/archive_task/archive_tasks.dart';
import 'layout/home_layout.dart';
import 'package:sqflite/sqflite.dart';

import 'modules/counter/stateful.dart';


void main() {

  Bloc.observer = MyBlocObserver();

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



