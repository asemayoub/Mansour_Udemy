import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newtharwat/modules/archive_task/archive_tasks.dart';
import 'package:newtharwat/modules/done_tasks/done_tasks.dart';
import 'package:newtharwat/modules/new_tasks/new_tasks.dart';
import 'package:newtharwat/shared/blockapp/cubit_app.dart';
import 'package:newtharwat/shared/blockapp/states_app.dart';
import 'package:newtharwat/shared/components/components.dart';
import 'package:sqflite/sqflite.dart';

class LayoutNav extends StatelessWidget {



  Database? database;



  @override

  Widget build(BuildContext context) {

    // هنا انا بعمل للاسكافولد مفتاح عشان اقدر اخليه يتفتح اما ادوس الزرار

    var scaffoldKey = GlobalKey<ScaffoldState>();
    var formKey = GlobalKey<FormState>();

    // هنا انا بعمل حالة البوتوم شيت عشان اعمله حالة شرطية يفتح ويتقفل اما ادوس الزرار
    bool isBottomSheetShown = false;

    // هنا بعرف الايقون بتاعه الفلوت اكشن بوتوم بفاريابل عشان اغيرها

    IconData? fabicon = Icons.add;

    // Form Controler Variables :

    var titleController = TextEditingController();
    var timeController = TextEditingController();
    var dateController = TextEditingController();






    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener:(context, AppStates state) {},
          builder: (context, AppStates state){

            AppCubit cubit = AppCubit.get(context);

            return Scaffold(

              key: scaffoldKey,

              // Add App Bar

              appBar: AppBar(
                title: Text(cubit.appbarScreen[cubit.currentIndex]),

              ),
              floatingActionButton: FloatingActionButton(
                onPressed: ()  {



                  if(isBottomSheetShown) {

                    // to validate form key

                    if(formKey.currentState!.validate()){

                      insertToDatabase(
                          titleController, dateController, timeController).then((value){

                        Navigator.pop(context);

                        isBottomSheetShown = false;
                      });



                    }









                  }else {


                    scaffoldKey.currentState?.showBottomSheet((context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: formKey,
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

                                  // to show time in input

                                  showTimePicker(context: context,
                                      // to set time now
                                      initialTime: TimeOfDay.now()).then((value){
                                    // to format time at pm or am
                                    timeController.text = value!.format(context).toString();

                                    print(value.format(context));


                                  });



                                },
                                validate: (String? value){

                                  if(value!.isEmpty){

                                    return 'Time  Cant be empty';

                                  }else {

                                    return null;
                                  }

                                },





                              ),
                              SizedBox(height: 15,),
                              DefaultInput(

                                controller: dateController,
                                Type: TextInputType.datetime,
                                label: 'Date',
                                PrefexIcon: Icons.date_range,
                                onSubmit: (value){},
                                ontapFun: (){

                                  // to show Date in input

                                  showDatePicker(context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2024-05-03')).then((value){

                                    print(


                                        DateFormat.yMMMd().format(value!)

                                    );
                                    dateController.text = DateFormat.yMMMd().format(value);

                                  });




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
                      ),
                    ),
                        elevation: 40.0
                    ).closed.then((value) {

                      isBottomSheetShown = false;

                    });

                    isBottomSheetShown = true;



                  }






                },
                child:Icon(fabicon),),
              bottomNavigationBar: BottomNavigationBar(

                backgroundColor: Colors.grey[100],

                currentIndex: AppCubit.get(context).currentIndex,

                onTap: (index) {



                  AppCubit.get(context).changeIndex(index);



                },

                iconSize: 27,

                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                  BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Done'),
                  BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archive'),

                ],

              ),

              body: ConditionalBuilder(
                  condition: true,
                  builder: (context) => AppCubit.get(context).screens[AppCubit.get(context).currentIndex] ,
                  fallback: (context) => Center(child: CircularProgressIndicator(),),
              )

              ,




            );
          },

      ),
    );
  }







// 1- Create Database SQFlite

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

  // 2- Insert Table Into Database


  Future insertToDatabase(@required title, @required date, @required time) async  {


    return await database?.transaction((txn)async{

      await txn.rawInsert(
        'INSERT INTO Tasks (title, data, time, status) VALUES("$title","$date", "$time", "Now")',
      ).then((value){

        print('${value} Inserted Success fully');

      }).catchError((erorr){


        print('erorr is ${erorr.toString()}');
      });

      return null;

    });

  }

  // 3- Get Database

  void getDataFromDatabase() async {


    List<Map> tasks = await database!.rawQuery("SELECT * FROM Tasks");

  }



}

