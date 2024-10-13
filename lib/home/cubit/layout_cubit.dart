import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:untitled12p/Models/usermodel.dart';
import 'package:untitled12p/register/cache/network_cache.dart';
import 'package:http/http.dart' as http;
import 'package:untitled12p/home/cubit/layout_states.dart';
import 'package:http/http.dart';

import '../../register/cache/constent.dart';

class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit() : super(LayoutInitial());

  UserModel? userModel;
  void getUserData() async{
    Response response = await http.get(
      Uri.parse("https://student.valuxapps.com/api/profile"),
      headers: {
        'Authorization' : token!,
        'lang' : 'en'
      }
    );
    var responseData = jsonDecode(response.body);
    if( responseData['status'] == true){
      userModel = UserModel.fromJson(data: responseData['data']);
      emit(GetDataSuccess());
    }else{
      emit(GetDataFailed(message: responseData['message']));
    }
  }

  void changePassword({required String userCurrentPass,required String newPass})async{
    emit(ChangePassLoading());
    Response response = await http.post(
      Uri.parse("https://student.valuxapps.com/api/change-password"),
      headers: {
        'lang' : 'en',
        'Authorization' : token!
      },
      body: {
        'current_password' : userCurrentPass,
        'new_password' : newPass
    }
    );
    var responseDecoded = jsonDecode(response.body);
    if(response.statusCode == 200){
      if(responseDecoded['status'] == true){
        await CacheNetwork.cacheInsert(key: 'password', value: newPass);
        currentPassword = await CacheNetwork.cacheGet(key: 'password');
        emit(ChangePassSuccess());
      }else{
        emit(ChangePassFailed(responseDecoded['message']));
      }
    }else{
      emit(ChangePassFailed("something went wrong"));
    }


  }

}