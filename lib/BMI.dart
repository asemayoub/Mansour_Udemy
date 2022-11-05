import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newtharwat/BMIResultScreen.dart';


class BmiCalc extends StatefulWidget {
  const BmiCalc({Key? key}) : super(key: key);





  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {

  // Set Variable
  // Colors

    Color ?grey = Colors.grey[300];
    Color ?blue = Colors.blue;
    bool ismale = true;

    // Hight
    double Hight = 120.0;

    int Age = 15;
    int Weight = 40;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
      
      title: Text('BMI Calclutor'),
      
      
      ),

      body:

      Column(
        children: [
          // Male And Female
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(

                children: [

                  Expanded(
                    child: GestureDetector(
                      onTap: () {

                        setState(() {
                          ismale = true;
                        });
                      },
                      child: Container(
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Icon(Icons.male,size: 80.0,
                            color: ismale ? Colors.white : Colors.black,

                            ),
                            SizedBox(height: 5,),
                            Text('Male',
                              style: TextStyle(

                                fontSize: 30.0,

                                color: ismale ? Colors.white : Colors.black,

                              ),
                            ),


                          ],

                        ),
                        decoration: BoxDecoration(
                          color: ismale ? blue : grey,
                          borderRadius: BorderRadius.circular(10),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {

                        setState(() {
                          ismale = false;
                        });
                      } ,
                      child: Container(
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Icon(Icons.female,size: 80.0,
                            color:  !ismale ? Colors.white : Colors.black,
                            ),
                            SizedBox(height: 5,),
                            Text('Female',
                              style: TextStyle(

                                fontSize: 30.0,
                                color:  !ismale ? Colors.white : Colors.black,

                              ),
                            ),


                          ],

                        ),
                        decoration: BoxDecoration(
                          color: !ismale ? blue : grey,
                          borderRadius: BorderRadius.circular(10),

                        ),
                      ),
                    ),
                  ),


                ],

              ),
            ),
          ),
          // Heigh Slider
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,),
              child: Container(
                decoration: BoxDecoration(
                  color:Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Column(



                  children: [
                    SizedBox(height: 20.0,),
                    Text('Hight',style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${Hight.round()}',style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        Text('cm',style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                          ,),)


                      ],

                    ),
                    Slider(
                        value: Hight,
                        max: 250,
                        min: 60,
                        onChanged: (value){
                          setState(() {
                            Hight = value;

                          }
                          );
                        },
                      )

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          // Age And Age
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                        color:Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('Age',style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text('$Age',style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){

                                  setState(() {
                                    if (Age <1) {Age = 1;} else {Age--;}
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.remove),


                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    if (Age <1) {Age = 1;} else {Age++;}
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.add),


                              ),
                            ],
                          ),

                        ],


                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                        color:Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('Weight',style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text('$Weight',style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    if (Weight <1) {Weight = 1;} else {Weight--;}
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.remove),


                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    if (Weight <1) {Weight = 1;} else {Weight++;}
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.add),


                              ),
                            ],
                          ),

                        ],


                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          // Calculate Buttom
          MaterialButton(
            minWidth: double.infinity,
            height: 60.0,
            color: Colors.blue,
            hoverColor: Colors.red,
            onPressed: (){
              late double Result = Weight / pow(Hight / 100, 2);
              print(Result.round());
              
              Navigator.push(

                context,

                MaterialPageRoute(

                    builder: (context) => BmiResult(Result: Result, Age: Age, ismale: ismale),


                )



              );

            },
            child: Text('Caculate',

            style: TextStyle(

              color: Colors.white,
              fontSize: 18.0,

            ),


          ),

          )
        ],
      ),

      

    );
  }
}
