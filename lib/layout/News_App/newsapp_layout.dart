import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtharwat/Network/remote/dio_helper.dart';
import 'package:newtharwat/layout/News_App/Cubite/newsapp_cubit.dart';
import 'package:newtharwat/layout/News_App/Cubite/newsapp_stats.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, stats) {},
        builder: (context, stats){

          var cubit = NewsCubit.get(context);

            return Scaffold(

              appBar: AppBar(

                title: Text('News App'),
                actions: [
                  Padding(padding: EdgeInsetsDirectional.only(end: 20,),

                  child:Icon(
                    Icons.search,
                  ) ,
                  )

                  
                ],

              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.CurrentIndex,
                items:cubit.bottomItems,
                onTap: (index){

                  cubit.ChangeButtomNav(index);

                },

              ) ,
              
              floatingActionButton: FloatingActionButton(onPressed: (){






              },

                  child: Icon(Icons.add),

                  ),

              body: cubit.Screen[cubit.CurrentIndex],




            );


          },
      ),
    );
  }
}
