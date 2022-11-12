import 'package:flutter/material.dart';

class DoneTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
            'Done Tasks',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
