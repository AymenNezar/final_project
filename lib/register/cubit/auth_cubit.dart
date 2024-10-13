import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:untitled12p/register/cache/constent.dart';
import 'package:untitled12p/register/cache/network_cache.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:untitled12p/register/cubit/auth_status.dart';
import 'package:http/http.dart';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit(): super(InitialState());

  void register({required String name , required String phone,required String email,required String password})async{
    emit(RegisterLoading());

      Response response = await http.post(

      Uri.parse('https://student.valuxapps.com/api/register'),
      body: {
        'name' : name,
        'phone' : phone,
        'email' : email,
        'password' : password
      },
      headers: {
        'lang' : 'en'
      }
    );

    var responseBody = jsonDecode(response.body);
    if(responseBody['status'] == true){
      emit(RegisterSuccess());

    }else{
      emit(RegisterFailed(message: responseBody['message']));

    }
}
  // user / email: hamed23312@gmail.com / password: hamed1234
  void login({required String email , required String password})async{
    emit(LoginLoading());
    try{
      Response response = await http.post(
          Uri.parse('https://student.valuxapps.com/api/login'),
          body: {
            'email' : email,
            'password' : password
          },
          headers: {
            'lang' : 'en'
          }

      );
      if( response.statusCode == 200){
        var data = jsonDecode(response.body);
        if( data['status'] == true){
          await CacheNetwork.cacheInsert(key: 'token', value: data['data']['token']);
          await CacheNetwork.cacheInsert(key: 'password', value: password);
          currentPassword = await CacheNetwork.cacheGet(key: "password");
          emit(LoginSuccess());
        }else{
          debugPrint('User login failed and reason is: ${data['message']}');
          emit(LoginFailed(message: data['message']));
        }
      }
    } catch(e){
      emit(LoginFailed(message : e.toString()));
    }

  }

}

