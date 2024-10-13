import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled12p/register/cubit/auth_cubit.dart';
import 'package:untitled12p/register/cubit/auth_status.dart';

import '../myVariables/my_Button.dart';
import '../myWidgets/my_TextField.dart';
import '../home/home.dart';
import 'login.dart';

class signup extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  signup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if( state is RegisterSuccess){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
          }else if( state is RegisterFailed){
            showDialog(context: context, builder: (context) => AlertDialog(
              content: Text(state.message, style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.red.shade400,
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          MyTextfield(
                            inputTypee: TextInputType.text,
                            isPass: false,
                            lableTextt: "Username",
                            textController: nameController,
                            validator: (input) {
                              if (nameController.text.isEmpty) {
                                return 'username must not be empty';
                              }
                            },
                          ),
                          SizedBox(
                            height: 30,
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
                            isPass: false,
                            lableTextt: "Phone",
                            textController: phoneController,
                            validator: (input) {
                              if (phoneController.text.isEmpty) {
                                return 'phone must not be empty';
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
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  BlocProvider.of<AuthCubit>(context)
                                      .register(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              style: myButton,
                              child: Text( state is RegisterLoading ? 'Loading..' : 'Sign up',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have account?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => login()),
                                  );
                                },
                                child: Text('Login'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
