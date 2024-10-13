import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled12p/provider/cards.dart';
import 'package:untitled12p/register/cache/constent.dart';
import 'package:untitled12p/register/cache/network_cache.dart';
import 'package:untitled12p/register/cubit/auth_cubit.dart';
// import 'package:untitled12p/screens/checkout.dart';
// import 'package:untitled12p/screens/detailes.dart';
// import 'package:untitled12p/home/home.dart';
import 'package:provider/provider.dart';
import 'package:untitled12p/screens/splash.dart';
import 'package:untitled12p/theme/theme.dart';
import 'package:untitled12p/theme/themeBloc.dart';
// import 'package:untitled12p/screens/login.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.cacheInitialization();
  token = CacheNetwork.cacheGet(key: 'token');
  currentPassword = CacheNetwork.cacheGet(key: 'password');
  runApp(myApp());
}

class myApp extends StatelessWidget {
  myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create:(context) {return Cards();}),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ThemeBloc())
      ],
      child: BlocBuilder<ThemeBloc , ThemeMode>(
    builder: (context , state){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: splash(),
        theme: lightMode,
        themeMode: state,
        darkTheme: darkMode,
      );
    }
    ),
    );
  }
  }

