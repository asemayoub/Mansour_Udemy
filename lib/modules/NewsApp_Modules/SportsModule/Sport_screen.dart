import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtharwat/layout/News_App/Cubite/newsapp_cubit.dart';
import 'package:newtharwat/layout/News_App/Cubite/newsapp_stats.dart';
import 'package:newtharwat/layout/Todo_App/Cubite/cubit_app.dart';
import 'package:newtharwat/shared/components/components.dart';

class SportScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsAppStates>(
      listener:(context,state) {},
      builder: (context, state) {

        var SportsList = NewsCubit.get(context).Sports;

        return ConditionalBuilder(
            condition: SportsList.length >0,
            builder: (context) => ListView.separated(
                itemBuilder: (context,index)=> NewsItem(SportsList[index]),
                separatorBuilder: (context,index) => DeviderItem(),
                itemCount: SportsList.length),
            fallback: (context) => Center(child: CircularProgressIndicator())

        );

      },
    );
  }
}
