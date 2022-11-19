import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtharwat/modules/counter/bloc/cubit.dart';
import 'package:newtharwat/modules/counter/bloc/states.dart';

class CounterClass extends StatelessWidget {


  @override


  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(

        listener: (context, state){},

        builder:(context, state){

          return Scaffold(

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

                          'counter',
                          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold,)

                          ,),
                      ),


                      TextButton(onPressed: (){



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


                      }, child: Text('Reset',style: TextStyle(fontSize: 15.0,),))
                    ],

                  ),
                ],
              ),

            ),

          );

        },



      ),
    );


  }
}

