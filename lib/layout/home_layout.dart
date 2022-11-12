import 'package:flutter/material.dart';
import 'package:newtharwat/modules/archive_task/archive_tasks.dart';
import 'package:newtharwat/modules/done_tasks/done_tasks.dart';
import 'package:newtharwat/modules/new_tasks/new_tasks.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(

      // Add App Bar

      appBar: AppBar(
        title: Text(appbarScreen[currentIndex]),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
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
  }
}
