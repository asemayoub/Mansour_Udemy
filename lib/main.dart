import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtharwat/Network/remote/dio_helper.dart';
import 'package:newtharwat/shared/bloc_observe.dart';

import 'layout/News_App/newsapp_layout.dart';
import 'modules/archive_task/archive_tasks.dart';
import 'layout/Todo_App/home_layout.dart';
import 'package:sqflite/sqflite.dart';

import 'modules/counter/stateful.dart';


void main() {

  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // Set Theme In APp
      theme: ThemeData(

        primarySwatch: Colors.orange,

        // Set App Bar Theme
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.orange,),
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(

            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w400,

          ),

          // Change Status Style Up AppBar

          backwardsCompatibility: false,
          // Set Status Style
          systemOverlayStyle: SystemUiOverlayStyle(

            statusBarColor: Colors.deepOrange



          ),



        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(

          type: BottomNavigationBarType.fixed,
          elevation: 20,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,



        ),

        // ButtomNavBar Theme


      ),
      debugShowCheckedModeBanner: false,
      home: NewsLayout(),
    );
  }
}



