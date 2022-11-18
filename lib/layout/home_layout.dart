import 'package:flutter/material.dart';
import 'package:newtharwat/modules/archive_task/archive_tasks.dart';
import 'package:newtharwat/modules/done_tasks/done_tasks.dart';
import 'package:newtharwat/modules/new_tasks/new_tasks.dart';
import 'package:newtharwat/shared/components/components.dart';
import 'package:sqflite/sqflite.dart';

class LayoutNav extends StatefulWidget {


  @override
  State<LayoutNav> createState() => _LayoutNavState();
}

class _LayoutNavState extends State<LayoutNav> {
  AnimationController? animationController;

  @override
  dispose() {
    animationController!.dispose(); // you need this
    super.dispose();
  }



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

    // هنا انا بعمل للاسكافولد مفتاح عشان اقدر اخليه يتفتح اما ادوس الزرار

    var scaffoldKey = GlobalKey<ScaffoldState>();

    // هنا انا بعمل حالة البوتوم شيت عشان اعمله حالة شرطية يفتح ويتقفل اما ادوس الزرار
    bool isBottomSheetShown = false;

    // هنا بعرف الايقون بتاعه الفلوت اكشن بوتوم بفاريابل عشان اغيرها

    IconData? fabicon = Icons.edit;

    // Form Controler Variables :

    var titleController = TextEditingController();
    var timeController = TextEditingController();



    return Scaffold(

      key: scaffoldKey,

      // Add App Bar

      appBar: AppBar(
        title: Text(appbarScreen[currentIndex]),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          

         if(isBottomSheetShown) {

           Navigator.pop(context);

           isBottomSheetShown = false;







         }else {


           scaffoldKey.currentState?.showBottomSheet((context) => Container(
             color: Colors.grey[150],
             padding: EdgeInsets.all(20),
             child: Column(
               mainAxisSize: MainAxisSize.min,


               children: [


                   DefaultInput(

                     controller: titleController,
                     Type: TextInputType.text,
                     label: 'Task Title',
                     PrefexIcon: Icons.title,
                     onSubmit: (value){},
                     validate: (String? value){

                       if(value!.isEmpty){

                         return 'Task Title Cant be empty';

                       }else {

                         return null;
                       }

                     },





                   ),
                   SizedBox(height: 15,),
                   DefaultInput(

                     controller: timeController,
                     Type: TextInputType.datetime,
                     label: 'Time',
                     PrefexIcon: Icons.watch,
                     onSubmit: (value){},
                     ontapFun: (){

                       showTimePicker(context: context,
                           initialTime: TimeOfDay.now());

                     },
                     validate: (String? value){

                       if(value!.isEmpty){

                         return 'Time  Cant be empty';

                       }else {

                         return null;
                       }

                     },





                   ),




                 ]


             ),
           ));
           isBottomSheetShown = true;

         }






        },
        child:Icon(fabicon),),
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
  }



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
      'INSERT INTO Tasks (title, data, time, status) VALUES("title test","21/11/2022", "8.30pm", "Done")',
    ).then((value){

      print('${value} Inserted Success fully');

    }).catchError((erorr){


      print('erorr is ${erorr.toString()}');
    });

    return null;

  });

}