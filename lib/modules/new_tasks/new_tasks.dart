import 'package:flutter/material.dart';

class NewTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
            'New Tasks',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
