import 'dart:convert';


import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthController extends GetxController {
  final String _userDataKey = 'user-data';
  final String _tokenKey = 'access-token';

  UserModel? userModel;
  String? accessToken;

  Future<void> saveUserData(String token, UserModel model) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));
    await sharedPreferences.setString(_tokenKey, token);
    userModel = model;
    accessToken = token;
  }

  Future<void> getUserData() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString(_userDataKey);
    String? tokenData = sharedPreferences.getString(_tokenKey);
    if (userData != null) {
      userModel = UserModel.fromJson(jsonDecode(userData));
    } else {
      userData = null;
    }
    accessToken = tokenData;
  }

  Future<bool> isUserLoggedIn() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    sharedPreferences.getString(_tokenKey);
    await getUserData();
    return true;
  }

  Future<void> clearUserData() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = null;
    userModel = null;
  }
}
