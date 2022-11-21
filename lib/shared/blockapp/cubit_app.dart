import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtharwat/shared/blockapp/states_app.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/archive_task/archive_tasks.dart';
import '../../modules/done_tasks/done_tasks.dart';
import '../../modules/new_tasks/new_tasks.dart';


class AppCubit extends Cubit<AppStates> {

  AppCubit() : super (initalizeAppStates());

  static AppCubit get(context) => BlocProvider.of(context);



  List<Widget> screens = [

    NewTasks(),
    DoneTasks(),
    ArchiveTasks(),
  ];

  List<String> appbarScreen = [

    'New Tasks',
    'Done Tasks',
    'Archive Tasks'

  ];
  int currentIndex = 0;
  List<Map> tasks = [];


void changeIndex(int index) {

  currentIndex = index;

  emit(AppChangeBottomNavBarState());









}


// ======================== Buttom Sheet Variables

  IconData fabIcon = Icons.edit;

  // هنا انا بعمل حالة البوتوم شيت عشان اعمله حالة شرطية يفتح ويتقفل اما ادوس الزرار
  bool isBottomSheetShown = false;

void ChangeBottomSheet ({

  @required bool? isShow,
  @required IconData? icon,

}) {

 fabIcon = icon!;

 isBottomSheetShown = isShow!;

emit(AppChangeBottomSheetState());



}


// ======================================= DataBase Start

  Database? database;


// 1- Create DB
  void createDatabase()  {

    // يتم عمل هذا الكلاس اولاً لانتشاء الداتا بيز
    openDatabase(

      // يكتب هنا اسم قاعدة البينات والاصدار  الخاص بها

      'TodoTasks.db',
      version: 1,

      // بعد كتابتهم تستعدي هذه ويكتب فيها قاعدة البينات والاصدار

      onCreate: (database, version) {

        print('1- Data Base Is Created ');

        // Create Table

        // يتم انشاء جداول لقاعدة البينات كالاتي

        database.execute('CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, data TEXT, time TEXT, status TEXT ) ').then((value){

          print('3-Table Is Created');

        }).catchError((erorr){

          print('Erorr In Data Base Is ${erorr.toString()}');

        });

      },

      // Open DataBase


      onOpen: (database) {

        print('2- Data Base Is Opened');

        // Get Data Base After Open

        getDataFromDatabase(database).then((value) {

          tasks = value;
          print(tasks);

          emit(AppGetDBStates());

        }).catchError((erorr){
          print('Get Data Base Erorr Is ${erorr.toString()}');
        });




      },


      // Emit DB With Cubit

    ).then((value){

      database = value;
      emit(AppCreateDBStates());


    });



  }


// Insert Database

  insertToDatabase(@required title, @required date, @required time) async  {


     await database?.transaction((txn)async{

      await txn.rawInsert(
        'INSERT INTO Tasks (title, data, time, status) VALUES("$title","$date", "$time", "Now")',
      ).then((value){



        print('${value} Inserted Success fully');

        emit(AppInsertDBStates());


        getDataFromDatabase(database).then((value) {

          tasks = value;
          print(tasks);

          emit(AppGetDBStates());

        });


      }).catchError((erorr){


        print('erorr is ${erorr.toString()}');
      });

      return null;

    });

  }


// Get Database






  // ======================================= DataBase End




  Future<List<Map>> getDataFromDatabase(database) async {


    return await database!.rawQuery("SELECT * FROM Tasks");

  }


}