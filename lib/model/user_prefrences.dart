import 'dart:convert';

import 'package:project_flutter/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUserPrefs{
  static Future<void> saveRememberUser(User userInfo) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData =  jsonEncode(userInfo.toJson());
    await preferences.setString("currentUser", userJsonData);
  }
}