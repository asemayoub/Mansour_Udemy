

import 'package:flutter/material.dart';
import 'package:newtharwat/modules/login/modules.dart';

Widget DefaultButtom({

 double Width = double.infinity,

 Color color = Colors.blue,

 double radius = 8.0,

 bool upercase = true,

 required String TextLog,

 required Function() function,


}) => Container(
decoration: BoxDecoration(
 color: color,

 borderRadius: BorderRadius.circular(radius),

),

width: Width,

child: MaterialButton(
onPressed: function,
child: Text(
 upercase ? TextLog.toUpperCase() : TextLog,
style: TextStyle(
 fontSize: 20,
color: Colors.white,
),
),
),










    );



// Default Input

Widget DefaultInput({

 required TextEditingController controller,

 required TextInputType Type,

 required String label,

required IconData? PrefexIcon,

 IconData? SufixIcon,

 bool obSecure = false,

  Function(String)? onSubmit,

 required String? Function(String?)? validate,

 Function(String)? onChange,

 Function()? ShowPassFun,
 Function()? ontapFun,








}) =>

TextFormField(
 onTap:ontapFun ,
controller: controller,
keyboardType: Type,
onFieldSubmitted:onSubmit!,
validator: validate!,
onChanged:onChange,
obscureText: obSecure,
decoration: InputDecoration(
labelText: label,
prefixIcon:PrefexIcon != null ? Icon(PrefexIcon,) : null ,
suffixIcon:SufixIcon != null ? IconButton(
    onPressed:ShowPassFun ,
    icon: Icon(SufixIcon,)


) : null ,
border: OutlineInputBorder(),
),
);
