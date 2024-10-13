import 'package:flutter/material.dart';

import '../home/home.dart';
import '../register/cache/constent.dart';
import '../register/login.dart';

class splash extends StatefulWidget {
  const splash({super.key});


  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => token != null && token != "" ? home() : login()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/img/Logo.png',width: 130,),
      ),
    );
  }
}

