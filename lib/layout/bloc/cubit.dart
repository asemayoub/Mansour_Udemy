import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtharwat/layout/bloc/states.dart';

class FabIconCubut extends Cubit<FabIconStates> {

  FabIconCubut() :super (FabIconIntialize());


  static FabIconCubut get(context) => BlocProvider.of(context);

  IconData fabIcon = Icons.add;

  void IconAdd() {

    IconData fabIcon = Icons.add;

    emit(FabIconAdd());

}
  void IconEdit() {

    IconData fabIcon = Icons.edit;

    emit(FabIconEdit());

}


}