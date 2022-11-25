

import 'package:flutter/material.dart';
import 'package:newtharwat/modules/login/modules.dart';
import 'package:newtharwat/layout/Todo_App/Cubite/cubit_app.dart';

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

Widget buildTaskItem(Map model,context) => Padding(
 padding: const EdgeInsets.all(20.0),
 child: Row(
  children: [
   CircleAvatar(
    radius: 40.0,
    child: Text('${model['time']}'),


   ),
   SizedBox(width: 10,),
   Expanded(
     child: Column(

      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

       Text('${model['title']}',
        maxLines: 2,

        style: TextStyle(

         fontSize: 20.0,
         fontWeight: FontWeight.bold,
         color: Colors.black,


        ),

       ),
       SizedBox(
        height: 5,
       ),
       Text('${model['data']}',

        style: TextStyle(

         fontSize: 14.0,
         fontWeight: FontWeight.w500,
         color: Colors.grey,

        ),

       ),

      ],

     ),
   ),
   Row(
    children: [
     IconButton(onPressed: (){

      AppCubit.get(context).UpdateDataBase(status: 'Done', id: model['id'],);


     },
         icon: Icon(Icons.check_box,color: Colors.green,size: 28,),
     ),
     IconButton(onPressed: (){

      AppCubit.get(context).UpdateDataBase(status: 'Archive', id: model['id'],);
     },
      icon: Icon(Icons.archive,color: Colors.grey,size: 28,),
     ),
    ],
   )
  ],
 ),
);
// News Item Widget
Widget NewsItem(article) => Padding(
 padding: const EdgeInsets.all(20.0),
 child: Row(

  children: [


   Container(

    width: 120,
    height: 120,
    decoration: BoxDecoration(

     borderRadius: BorderRadius.circular(10.0),
     image: DecorationImage(
      image:
      NetworkImage('${article['urlToImage']}',
      ),
      fit: BoxFit.cover,




     ),


    ),

   ),
   SizedBox(width: 20,),
   Expanded(
    child: Container(
     height: 120,
     child: Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,

      children: [

       Text('${article['title']}'
        ,
        style: TextStyle(
         fontSize: 18.0,
         fontWeight: FontWeight.w600,

        ),
        maxLines: 3,
        overflow:TextOverflow.ellipsis ,

       ),
       SizedBox(height: 10,),
       Text('${article['publishedAt']}'
        ,
        style: TextStyle(
         fontSize: 13.0,
         fontWeight: FontWeight.w600,
         color: Colors.grey,

        ),

       ),


      ],


     ),
    ),
   ),



  ],

 ),
);

Widget DeviderItem() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child:   Container(

   width: 1,
   height: 1,
   color: Colors.grey[300],

  ),
);
