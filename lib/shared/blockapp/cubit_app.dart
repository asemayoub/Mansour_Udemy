import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtharwat/shared/blockapp/states_app.dart';
import '../../modules/archive_task/archive_tasks.dart';
import '../../modules/done_tasks/done_tasks.dart';
import '../../modules/new_tasks/new_tasks.dart';


class AppCubit extends Cubit<AppStates> {

  AppCubit() : super (initalizeAppStates());

  static AppCubit get(context) => BlocProvider.of(context);



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

void changeIndex(int index) {

  currentIndex = index;

  emit(AppChangeBottomNavBarState());


}


}