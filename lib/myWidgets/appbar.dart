import 'package:flutter/material.dart';
import '../myVariables/colors.dart';
import 'Row.dart';

  PreferredSizeWidget appbar({required String name}){
    return AppBar(
      elevation: 3,
      shadowColor: Colors.grey,
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        MyRow()

      ],
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: mainColor,
    );
  }
