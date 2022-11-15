import 'package:flutter/material.dart';
import 'package:newtharwat/modules/archive_task/archive_tasks.dart';
import 'package:newtharwat/modules/done_tasks/done_tasks.dart';
import 'package:newtharwat/modules/new_tasks/new_tasks.dart';
import 'package:sqflite/sqflite.dart';

class LayoutNav extends StatefulWidget {


  @override
  State<LayoutNav> createState() => _LayoutNavState();
}

class _LayoutNavState extends State<LayoutNav> {


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



  @override

  void initState() {
    super.initState();
    createDatabase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Add App Bar

      appBar: AppBar(
        title: Text(appbarScreen[currentIndex]),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          insertToDatabase();
        },
        child: Icon(Icons.add),),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.grey[100],

        currentIndex: currentIndex,

        onTap: (index) {

          setState(() {

            currentIndex  = index;
          });

        },

        iconSize: 27,

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Done'),
            BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archive'),

          ],

      ),

      body: screens[currentIndex],




    );
  }}

  Future<String> getname() async {

    return 'ahmedali';
  }

Database? database;

  void createDatabase() async {


    database = await openDatabase(

      'TodoTasks.db',
      version: 1,

      onCreate: (database, version) {

        print('1- Data Base Is Created ');

        database.execute('CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, data TEXT, time TEXT, status TEXT ) ').then((value){

          print('3-Table Is Created');

        }).catchError((erorr){

          print('Erorr In Data Base Is ${erorr.toString()}');

        });

      },

      onOpen: (database) {

        print('2- Data Base Is Opened');

      },



    );



  }

  void insertToDatabase()  {


    database?.transaction((txn)async{

      await txn.rawInsert(
        'INSERT INTO Tasks (title, data, time, status) VALUES("title test","20/11/2022", "5.30pm", "Done")',
      ).then((value){

      print('$value Inserted Success fully');

      }).catchError((erorr){


        print('erorr is ${erorr.toString()}');
      });

      return null;

    });

  }



