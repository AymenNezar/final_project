import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextInputType inputTypee;
  final bool isPass;
  final String lableTextt;
  final TextEditingController textController;
  final FormFieldValidator<String>? validator;
  final IconButton? suffixIcon;


  MyTextfield({
    super.key,
    required this.inputTypee,
    required this.isPass,
    required this.lableTextt,
    required this.textController,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: validator,
      keyboardType: inputTypee,
      obscureText: isPass,
      cursorColor: Colors.grey.shade600,
      decoration: InputDecoration(
        labelText: lableTextt,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(
          color: Colors.grey.shade700, // Change label color
          fontSize: 15, // Change label font size
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(  // Add this
          borderSide: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(  // Add this
          borderSide: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.all(12),
      ),
    );
  }
}
