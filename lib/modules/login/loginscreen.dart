import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool Ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:20),

                  // Email Input

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
                  SizedBox(height:10),

                  // Password Input

                  DefaultInput(controller: passwordController,
                    Type: TextInputType.visiblePassword,
                    label: 'Password',
                     PrefexIcon: Icons.lock,
                    onSubmit: (value){return null;},
                    onChange: (value){return null;},
                    obSecure: Ispassword,
                    SufixIcon: Ispassword ? Icons.visibility : Icons.visibility_off,
                    ShowPassFun: (){

                    setState(() {

                      Ispassword = !Ispassword;
                    });

                    },

                    validate: (value){

                      if(value!.isEmpty) {return 'Password Must Not Be Empty';}
                      return null;


                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  DefaultButtom(TextLog: 'Login',
                      upercase:false,
                      color: Colors.red,


                      function: (){

                    if (formkey.currentState!.validate()){

                      print(emailController.text);
                      print(passwordController.text);

                    }


                      }),
                  SizedBox(height: 10,),





                  // Login Button


                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
