import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/cubit/layout_cubit.dart';
import '../home/cubit/layout_states.dart';
import '../home/home.dart';
import '../home/profile.dart';
import '../myVariables/colors.dart';
import '../register/cache/network_cache.dart';
import '../register/login.dart';
import '../theme/themeBloc.dart';
import '../theme/themeEvent.dart';

class drawer extends StatelessWidget {
  drawer({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LayoutCubit()..getUserData(),
        child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context,state){

    },
    builder: (context,state) {
      final cubit = BlocProvider.of<LayoutCubit>(context);
      return cubit.userModel != null ? Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(cubit.userModel!.name!),
                accountEmail: Text(cubit.userModel!.email!),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(cubit.userModel!.image!),
                ),
                decoration: BoxDecoration(
                  color: mainColor, // Change header background color
                ),
              ),
              Column(
                children: [
                  ListTile(
                    title: Text("Profile"),
                    leading: Icon(Icons.person),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => profile()));

                    },
                  ),
                  ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.home),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => home()));
                    },
                  ),
                  ListTile(
                    title: Text("About"),
                    leading: Icon(Icons.help),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("Log out"),
                    leading: Icon(Icons.logout),
                    onTap: ()  {

                    },
                  ),
                  BlocBuilder<ThemeBloc, ThemeMode>(
                    builder: (context, themeMode) {
                      return SwitchListTile(
                        title: Text("Change Theme"),
                        value: themeMode == ThemeMode.dark,
                        onChanged: (value) {
                          BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(value));
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              '© 2025 All rights reserved.',
              style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
            ),
          ),
        ],
      ) : Center(child: CircularProgressIndicator(),);
    }
    ),
    );
  }
}
