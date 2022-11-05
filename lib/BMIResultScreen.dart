import 'package:flutter/material.dart';


class BmiResult extends StatelessWidget {

  late final double Result;
  late final bool ismale;
  late final int Age;

  BmiResult({

   required this.Result,
   required this.Age,
   required this.ismale,

});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        
        title: Text('BMI Result Screen'),
        
      ),
body: Center(
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.center,

    children: [

      Text('Gender : ${ismale ? 'Male' : 'Female'}',

      style: TextStyle(

        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.red,


      ),

      ),
      Text('Result : ${Result.round()}',

      style: TextStyle(

        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.red,


      ),

      ),
      Text('Age : $Age ',

      style: TextStyle(

        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.red,


      ),

      ),


    ],

  ),
),

    );
  }
}
