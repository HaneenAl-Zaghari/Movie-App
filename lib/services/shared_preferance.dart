import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data extends ChangeNotifier {
  bool isFirstTime = false;

  Data() {
    getUserInfo();
  }

  setUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirst', isFirstTime = !isFirstTime);
    notifyListeners();
  }

  Future<void> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool('isFirst') ?? false;
    notifyListeners();
  }
}
