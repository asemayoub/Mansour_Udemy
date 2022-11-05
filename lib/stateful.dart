import 'package:flutter/material.dart';

class StateCounter extends StatefulWidget {
  @override

  // Rebuild Classs To Build New Widget

  State<StateCounter> createState() => CounterState();
}

class CounterState extends State<StateCounter> {

  int counter = 0;

  // 1. constructor

  // 2. initstate

  // 3. build state

  // يبقي اول حاجه عشان اخلي الميثود تستعدى بكريت ستات فل
  // بعد كده بحط الميثود بتاعه  inistate
  //
  // بعد كده باجي جوا زرار الاستدعاء استدعي ميثود set state واحط فيها الكود
  //



  @override

  void initState() {
    // TODO: implement initState
    super.initState();
  }


  Widget build(BuildContext context) {

    return(Scaffold(

appBar: AppBar(

  title: Text('Counter'),

),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                TextButton(onPressed: (){

                  if (counter <= 0) {

                    setState(() {
                      print(0);
                    });

                  } else {

                    setState(() {
                      counter--;
                      print(counter);
                    });
                  }

                }, child:

                Text(

                  'Minus',

                  style: TextStyle(

                    fontSize: 18.0,

                  ),




                )),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,),
                  child: Text(

                    '$counter',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold,)

                  ,),
                ),


                TextButton(onPressed: (){

                if (counter < 0) {

                  setState(() {
                    print(0);
                  });

                } else {

                  setState(() {
                    counter++;
                    print(counter);
                  });
                }

                }, child:

                Text(

                  'Plus',

                  style: TextStyle(

                    fontSize: 18.0,

                  ),




                ))

              ],


            ),
            Column(
              
              children: [
                TextButton(onPressed: () {

                  setState(() {
                    counter = 0;
                    print(counter);

                  });

                }, child: Text('Reset',style: TextStyle(fontSize: 15.0,),))
              ],
              
            ),
          ],
        ),

      ),

    ));


  }


}

