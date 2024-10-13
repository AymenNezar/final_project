import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled12p/home/changepass.dart';
import 'package:untitled12p/home/cubit/layout_cubit.dart';
import 'package:untitled12p/home/cubit/layout_states.dart';

import '../myWidgets/Drawer.dart';
import '../myWidgets/appbar.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getUserData(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context,state){

        },
        builder: (context,state){
          final cubit = BlocProvider.of<LayoutCubit>(context);
          return SafeArea(
            child: Scaffold(
              appBar: appbar(name: 'Profile'),
              drawer: Drawer(
                child: drawer(),
              ),
              body: cubit.userModel != null ?
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(cubit.userModel!.image!),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(cubit.userModel!.name!,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text(cubit.userModel!.email!, style: TextStyle(fontSize: 15 , color: Colors.grey.shade700),),
                      SizedBox(height: 20,),
                      ElevatedButton(
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => changePass()));
                          },
                          child: Text('Change Password'))
                    ],

                  ),
                ),
              ) :
              Center(child: CircularProgressIndicator(),),
            ),
          );
        },

      )
    );
  }
}
