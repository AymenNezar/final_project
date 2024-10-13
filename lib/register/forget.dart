import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled12p/myWidgets/my_TextField.dart';
import 'package:http/http.dart' as http;

import '../myVariables/my_Button.dart';

class forget extends StatefulWidget {
  forget({super.key});


  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }


  //   Future<void> checkUserAndSendEmail() async {
  //     final email = emailController.text.trim();
  //
  //     try {
  //       final response = await http.post(
  //         Uri.parse('https://student.valuxapps.com/api/verify-email'),
  //         body: {'email': email},
  //         headers: {'lang': 'en'},
  //       );
  //
  //       if (response.statusCode == 200) {
  //         var data = jsonDecode(response.body);
  //         if (data['status'] == true) {
  //           await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(content: Text('Password reset email sent!')),
  //           );
  //         } else {
  //           // User does not exist
  //           _showErrorDialog('User does not exist!');
  //         }
  //       } else {
  //
  //         _showErrorDialog('Failed to check user. Please try again.');
  //       }
  //     } catch (e) {
  //
  //       _showErrorDialog('An error occurred: ${e.toString()}');
  //     }
  //   }
  // void _showErrorDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Error'),
  //         content: Text(message),
  //         actions: [
  //           TextButton(
  //             child: Text('OK'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('verify email', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            MyTextfield(
                inputTypee: TextInputType.emailAddress,
                isPass: false,
                lableTextt: 'Email',
                textController: emailController
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: (){},
                style: myButton,
                child: Text('Send'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

