import 'package:flutter/material.dart';
import 'package:newtharwat/shared/components/components.dart';

class Newpage extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(
  
  title: Text('test'),
),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key:formKey ,
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [



                DefaultInput(controller: emailController,
                    Type: TextInputType.emailAddress,
                    label: 'Email Adress',
                    PrefexIcon: Icons.email,
                    onSubmit: (value){},
                    onChange: (value){},
                    obSecure: false,
                    validate: (value){

                  if(value!.isEmpty) {return 'Email Adress Must Not Be Empty';}
                  return null;

                    },
                ),


                DefaultInput(controller: passwordController,
                  Type: TextInputType.visiblePassword,
                  label: 'Password',
                  PrefexIcon: Icons.lock,
                  onSubmit: (value){},
                  onChange: (value){},
                  obSecure: true,
                  validate: (value){

                    if(value!.isEmpty) {return 'Password Must Not Be Empty';}
                    return null;


                  },
                ),
                SizedBox(height: 15,),


                DefaultButtom(TextLog: 'Login', function: (){

                  if(formKey.currentState!.validate()){

                    print(emailController.text);
                    print(passwordController.text);
                  }

                }),

              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
