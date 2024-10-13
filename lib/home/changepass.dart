import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled12p/home/cubit/layout_cubit.dart';
import 'package:untitled12p/home/cubit/layout_states.dart';
import 'package:untitled12p/myWidgets/my_TextField.dart';
import 'package:untitled12p/register/cache/constent.dart';
import 'package:untitled12p/home/profile.dart';

import '../myVariables/my_Button.dart';

class changePass extends StatelessWidget {
  changePass({super.key});

  final currentpassController = TextEditingController();
  final newpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LayoutCubit()..getUserData(),
        child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context,state){

    },
    builder: (context,state){
      final cubit = BlocProvider.of<LayoutCubit>(context);
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Change Password',style: TextStyle(fontSize: 25),),
              SizedBox(height: 40,),
              MyTextfield(
                  inputTypee: TextInputType.text,
                  isPass: true,
                  lableTextt: 'Current Password',
                  textController: currentpassController
              ),
              SizedBox(height: 20,),
              MyTextfield(
                  inputTypee: TextInputType.text,
                  isPass: true,
                  lableTextt: 'New Password',
                  textController: newpassController
              ),
              SizedBox(height: 20,),
              BlocConsumer<LayoutCubit,LayoutStates>(
                  listener: (context,state){
                    if(state is ChangePassSuccess){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('successfully changed'),backgroundColor: Colors.green,));
                    }
                    if(state is ChangePassFailed){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error) ,backgroundColor: Colors.red,));
                    }
                  },
                  builder: (context,state){
                    return Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if(currentpassController.text.trim() == currentPassword){
                            if(newpassController.text.length >= 6){
                              cubit.changePassword(userCurrentPass: currentPassword!, newPass: newpassController.text.trim());
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Must Be At Least 6 Charecters'),backgroundColor: Colors.red,));
                            }
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Verify Current Password'),backgroundColor: Colors.red,));
                          }
                        },
                        style: myButton,
                        child: Text(state is ChangePassLoading ? 'Loading..' : 'Change', style: TextStyle(fontSize: 17),),
                      ),
                    );
                  }
              )
            ],
          ),
        ),
      );
    }
    )
    );
  }
}
