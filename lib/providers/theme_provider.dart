import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  //data
  ThemeMode currentAppTheme = ThemeMode.light;

  changeAppTheme(ThemeMode newAppTheme){
    if (currentAppTheme == newAppTheme){return;}
    currentAppTheme = newAppTheme;

    //notify listeners
    notifyListeners();
  }
}