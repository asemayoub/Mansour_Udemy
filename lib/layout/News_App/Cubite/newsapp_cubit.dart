import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtharwat/Network/remote/dio_helper.dart';
import 'package:newtharwat/layout/News_App/Cubite/newsapp_stats.dart';
import 'package:newtharwat/modules/NewsApp_Modules/BusinessModule/business_screen.dart';
import 'package:newtharwat/modules/NewsApp_Modules/Scince%20Module/since_screen.dart';
import 'package:newtharwat/modules/NewsApp_Modules/Setting/Setting_screen.dart';
import 'package:newtharwat/modules/NewsApp_Modules/SportsModule/Sport_screen.dart';

import 'package:dio/dio.dart';


class NewsCubit extends Cubit<NewsAppStates> {

  NewsCubit() : super (NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomItems = [

  BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business',backgroundColor: Colors.orange,),
  BottomNavigationBarItem(icon: Icon(Icons.sports_baseball),label: 'Sports',backgroundColor: Colors.blue,),
  BottomNavigationBarItem(icon: Icon(Icons.science_rounded),label: 'Science',backgroundColor: Colors.purple,),
  BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting',backgroundColor: Colors.grey,),

  ];


  int CurrentIndex = 0;

  // Set Screen Widget
  List<Widget?> Screen = [

    BusinessScreen(),

    SportScreen(),

    ScinceScreen(),

    SettingScreen(),


  ];


  void ChangeButtomNav (int index) {

    CurrentIndex = index;

    if(index == 1) getSports();

    if(index ==2) getSince();

    emit(NewsButtomNavState());



  }

  // Create News API  Cubit


  // Business Data Cubit

List<dynamic> business = [];

  void getBusiness() {

    // Emit Loading When Start

    emit(NewsGetBusinessLodaing());

    DioHelper.getData(

      url: 'v2/top-headlines',

      query: {

        'country' : 'eg',

        'category' : 'business',

        'apiKey' : 'a201f4666e884378a6f349167aed5ea3',

      },

    ).then((value) {

      // print(value?.data['articles']);

      business = value?.data['articles'];
      print(business[2]);

      emit(NewsGetBusinessSuccess());

    }).catchError((erorr) {

      print(erorr.toString());
      emit(NewsGetBusinessErorr(erorr.toString()));

    });


  }


  // Sports Data Cubit

  List<dynamic> Sports = [];

  void getSports() {

    // Emit Loading When Start

    emit(NewsGetBusinessLodaing());

    DioHelper.getData(

      url: 'v2/top-headlines',

      query: {

        'country' : 'eg',

        'category' : 'sports',

        'apiKey' : 'a201f4666e884378a6f349167aed5ea3',

      },

    ).then((value) {

      // print(value?.data['articles']);

      Sports = value?.data['articles'];
      print(Sports[2]);

      emit(NewsGetSportsSuccess());

    }).catchError((erorr) {

      print(erorr.toString());
      emit(NewsGetSportsErorr(erorr.toString()));

    });


  }



  // Since Data Cubit

  List<dynamic> Since = [];

  void getSince() {

    // Emit Loading When Start

    emit(NewsGetBusinessLodaing());

    DioHelper.getData(

      url: 'v2/top-headlines',

      query: {

        'country' : 'eg',

        'category' : 'science',

        'apiKey' : 'a201f4666e884378a6f349167aed5ea3',

      },

    ).then((value) {

      // print(value?.data['articles']);

      Since = value?.data['articles'];
      print(Sports[2]);

      emit(NewsGetSinceSuccess());

    }).catchError((erorr) {

      print(erorr.toString());
      emit(NewsGetSinceErorr(erorr.toString()));

    });


  }







}