import 'package:flutter/material.dart';
import 'package:todo_list/themes/dark_mode.dart';
import 'package:todo_list/themes/light_mode.dart';
import 'package:flutter/foundation.dart';


class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = lightmode;
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;
  set themeData (ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if (_themeData == lightmode){
      themeData= darkMode;
    }
    else{
      themeData = lightmode;
    }
  }
}