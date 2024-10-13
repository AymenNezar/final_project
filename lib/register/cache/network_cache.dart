import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork{
  static late SharedPreferences sharedPref;
  static Future cacheInitialization()async{
    sharedPref = await SharedPreferences.getInstance();
}

  static Future<bool> cacheInsert({required String key, required String value})async{
    return await sharedPref.setString(key, value);
  }

  static String cacheGet({required String key}){
    return sharedPref.getString(key) ?? "";
  }

  static Future<bool> cacheDelete({required String key})async{
    return await sharedPref.remove(key);
  }
}