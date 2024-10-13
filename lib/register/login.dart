import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled12p/myWidgets/my_TextField.dart';
import 'package:untitled12p/register/cubit/auth_status.dart';
import 'package:untitled12p/register/signup.dart';

import '../myVariables/my_Button.dart';
import 'cubit/auth_cubit.dart';
import '../home/home.dart';
import 'forget.dart';

class login extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: BlocConsumer<AuthCubit,AuthStates>(
                  listener: (context,state){
                    if( state is LoginSuccess){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => home()));
                    }
                    if( state is LoginFailed){
                      showDialog(context: context, builder: (context) => AlertDialog(
                        content: Text(state.message, style: TextStyle(color: Colors.white),),
                        backgroundColor: Colors.red.shade400,
                      ));
                    }
                  },
                  builder: (context,state){
                    return Column(
                    children: [
                      Text('Login', style:  TextStyle(fontSize:30,fontWeight:FontWeight.bold),),
                      SizedBox(
                        height: 80,
                      ),
                      MyTextfield(
                        inputTypee: TextInputType.emailAddress,
                        isPass: false,
                        lableTextt: "Email",
                        textController: emailController,
                        validator: (input) {
                          if (emailController.text.isEmpty) {
                            return 'email must not be empty';
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MyTextfield(
                        inputTypee: TextInputType.text,
                        isPass: true,
                        lableTextt: "Password",
                        textController: passwordController,
                        validator: (input) {
                          if (passwordController.text.isEmpty) {
                            return 'password must not be empty';
                          }
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,MaterialPageRoute(builder: (context) =>  forget()),
                            );
                          },
                          child: Text('forget password?', style: TextStyle(color: Colors.grey.shade600),),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate() == true) {
                                  BlocProvider.of<AuthCubit>(context)
                                      .login(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              style: myButton,
                            child: Text(state is LoginLoading ? 'Loading..' : 'Login', style: TextStyle(fontSize: 17),),
                        ),
                      ),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Create new account'),
                          TextButton(
                            onPressed: (){
                              Navigator.push(
                                context,MaterialPageRoute(builder: (context) =>  signup()),
                              );
                            },
                            child: Text('Sign up' , style: TextStyle(color: Colors.grey.shade600),),
                          )
                        ],
                      ),
                    ],
                  );
                  }
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
