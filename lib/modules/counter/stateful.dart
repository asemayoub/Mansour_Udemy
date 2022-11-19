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

        listener: (context, state){

          if (state is CounterMinusState) print('Minus State${state.counter}');
          if (state is CounterPlusState) print('Plus State${state.counter}');
          if (state is CounterResetState) print('Reset State${state.counter}');


        },

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


                        CounterCubit.get(context).minus();



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

                          '${CounterCubit.get(context).counter}',
                          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold,)

                          ,),
                      ),


                      TextButton(onPressed: (){


                        CounterCubit.get(context).plus();



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


                        CounterCubit.get(context).reset();


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

