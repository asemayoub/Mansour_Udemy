import 'package:flutter/material.dart';

Container defaultbutton(
    {width: double.infinity,
      color: Colors.blue,
      bool isupercase = true,
      @required String? text,
      @required Function? prissedfun,
    })
=> Container(
  width: width,
  color: color,
  child: MaterialButton(
    onPressed:() => prissedfun ,
    child: Text(
      '${isupercase ? text?.toUpperCase() : text}'
      ,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);