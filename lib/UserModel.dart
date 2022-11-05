
import 'package:flutter/material.dart';

// Add Class User Model

class UsersModel {

  final int? id;
  final String? name;
  final String? number;

  // Constructor
  UsersModel({

    @required this.id,
    @required this.name,
    @required this.number
});


}


class ListModelClass extends StatelessWidget {

// Add List

List<UsersModel> users = [


  UsersModel(id: 1, name: 'asemayoub', number: '+201110435306'),
  UsersModel(id: 2, name: 'mariha', number: '+201110435306'),
  UsersModel(id: 3, name: 'ahmed', number: '+201110435306'),
  UsersModel(id: 4, name: 'hussin', number: '+201110435306'),
  UsersModel(id: 5, name: 'magdy', number: '+201110435306'),
  UsersModel(id: 6, name: 'yaquoub', number: '+201110435306'),
  UsersModel(id: 7, name: 'mamdouh', number: '+201110435306'),
  UsersModel(id: 8, name: 'anan', number: '+201110435306'),
  UsersModel(id: 9, name: 'samir', number: '+201110435306'),
  UsersModel(id: 10, name: 'raveie', number: '+201110435306'),
  UsersModel(id: 11, name: 'retta', number: '+201110435306'),
  UsersModel(id: 12, name: 'nour', number: '+201110435306'),
  UsersModel(id: 13, name: 'sara', number: '+201110435306')


];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(

          title: Text('User Model'),



        ),

        body:
        // Build List Item
        ListView.separated(
          // user index لاستخرام كل ايتم علي حداه
            itemBuilder: (context, index) => buildUserItem(users[index]),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(start: 30.0,),
              child: Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey[300],
              ),
            ),
            // User Length عشان يعمل ليست بعدد الايتم الموجودة
            itemCount:users.length)



    );
  }

  // Build Item Widget

  // هنا بعرف الليست في البراميتر باي اسم استدعيها بيه علي سبيل المثال عاصم وببدا استدعيها في كل عنصر وحده
  Widget buildUserItem(UsersModel User) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(

      children: [

        CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.blue,

          child: Text(
            '${User.id}',
            style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 30.0,color: Colors.white
              ,)
            ,),


        ),
        SizedBox(width: 8.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${User.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0,),
            Text('${User.number}',style: TextStyle(color: Colors.grey,fontSize: 18.0),)

          ],
        ),

      ],


    ),
  );

}
